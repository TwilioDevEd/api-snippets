// Download the Node helper library from twilio.com/docs/libraries/node
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);
const service = client.messaging.services('MG2172dd2db502e20dd981ef0d67850e1a');

service
  .alphaSenders('AIc781610ec0b3400c9e0cab8e757da937')
  .remove()
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
