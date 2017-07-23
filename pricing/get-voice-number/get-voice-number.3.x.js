// Get your Account SID and Auth Token from twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio')(accountSid, authToken).pricing;

client.voice
  .numbers('+15108675309')
  .fetch()
  .then(number => {
    console.log(number.outboundCallPrice.current_price);
  })
  .catch(error => {
    console.log(error);
    throw error;
  });
