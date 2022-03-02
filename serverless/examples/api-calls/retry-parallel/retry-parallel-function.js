const axios = require('axios');
const qs = require('qs');

// The root URL for an API which is known to fail on occasion
const unstableSpaceUri = 'https://unstable-5604.twil.io';
// We'll declare these functions outside of the handler since they have no
// dependencies on other values, and this will tidy up our pRetry calls.
const astronautRequest = () => axios.get(`${unstableSpaceUri}/astros`);
const issRequest = () => axios.get(`${unstableSpaceUri}/iss`);
// Use a common object for retry configuration to DRY up our code :)
const retryConfig = (reqName) => ({
  retries: 3,
  onFailedAttempt: () => console.log(`Retrying ${reqName}...`),
});

exports.handler = async (context, event, callback) => {
  // We need to asynchronously import p-retry since it is an ESM module
  const { default: pRetry } = await import('p-retry');
  // Create a new voice response object
  const twiml = new Twilio.twiml.VoiceResponse();

  try {
    // Create a promise with retry for each API call that can be made
    // independently of each other
    const getAstronauts = pRetry(astronautRequest, retryConfig('astros'));
    const getIss = pRetry(issRequest, retryConfig('iss'));
    // pRetry returns a promise, so we can still use Promise.all to await
    // the result of both requests in parallel with retry and backoff enabled!
    const [astronauts, iss] = await Promise.all([getAstronauts, getIss]);

    const { number, people } = astronauts.data;
    const { latitude, longitude } = iss.data.iss_position;

    const names = people.map((astronaut) => astronaut.name).sort();

    // We can use reverse geocoding to convert the latitude and longitude
    // of the ISS to a human-readable location. We'll use positionstack.com
    // since they provide a free API.
    // Be sure to set your positionstack API key as an environment variable!
    const { data: issLocation } = await pRetry(
      () =>
        axios.get(
          `http://api.positionstack.com/v1/reverse?${qs.stringify({
            access_key: context.POSITIONSTACK_API_KEY,
            query: `${latitude},${longitude}`,
          })}`
        ),
      retryConfig('iss location')
    );

    const { label } = issLocation.data[0] || 'an unknown location';

    // Create a list formatter to join the names with commas and 'and'
    // so that the played speech sounds more natural
    const listFormatter = new Intl.ListFormat('en');

    twiml.say(`There are ${number} people in space.`);
    twiml.pause({ length: 1 });
    twiml.say(`Their names are: ${listFormatter.format(names)}`);
    twiml.pause({ length: 1 });
    twiml.say(
      `Also, the International Space Station is currently above ${label}`
    );
    // Return the final TwiML as the second argument to `callback`
    // This will render the response as XML in reply to the webhook request
    // and result in the message being played back to the user
    return callback(null, twiml);
  } catch (error) {
    // In the event of an error, return a 500 error and the error message
    console.error(error);
    return callback(error);
  }
};
