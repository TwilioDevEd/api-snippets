// Get your Account SID and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio')(accountSid, authToken).pricing;

client.voice
  .numbers('+15108675310')
  .fetch({
    originationNumber: '+12421234567'
  })
  .then(numbers => {
    console.log(number.outboundCallPriceWithOrigin.current_price);
    numbers.outboundCallPriceWithOrigin.forEach(price => {
      console.log(price.current_price);
    });
  })
  .catch(error => {
    console.log(error);
    throw error;
  });
