// Get your Account SID and Auth Token from twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio')(accountSid, authToken).pricing;

client.voice.countries('US').fetch()
  .then((country) => {
    country.inboundCallPrices.forEach((price) => {
        console.log(`Base:${price.base_price} Current:${price.current_price}`);
    });
  })
  .catch((error) => {
    console.log(error);
    throw error;
  });
