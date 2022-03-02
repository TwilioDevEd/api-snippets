const axios = require('axios');

const getAstronauts = () => axios.get('https://unstable-5604.twil.io/astros');

exports.handler = async (context, event, callback) => {
  // We need to asynchronously import p-retry since it is an ESM module
  const { default: pRetry } = await import('p-retry');
  // Create a new voice response object
  const twiml = new Twilio.twiml.VoiceResponse();

  try {
    let attempts = 1;
    // Open APIs From Space: http://open-notify.org
    // Number of people in space
    const response = await pRetry(getAstronauts, {
      retries: 3,
      onFailedAttempt: ({ attemptNumber, retriesLeft }) => {
        attempts = attemptNumber;
        console.log(
          `Attempt ${attemptNumber} failed. There are ${retriesLeft} retries left.`
        );
        // 1st request => "Attempt 1 failed. There are 3 retries left."
        // 2nd request => "Attempt 2 failed. There are 2 retries left."
        // …
      },
    });
    const { number, people } = response.data;

    const names = people.map((astronaut) => astronaut.name).sort();
    // Create a list formatter to join the names with commas and 'and'
    // so that the played speech sounds more natural
    const listFormatter = new Intl.ListFormat('en');

    twiml.say(`There are ${number} people in space.`);
    twiml.pause({ length: 1 });
    twiml.say(`Their names are: ${listFormatter.format(names)}`);
    // If retries were necessary, add that information to the response
    if (attempts > 1) {
      twiml.pause({ length: 1 });
      twiml.say(`It took ${attempts} attempts to retrieve this information.`);
    }
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
