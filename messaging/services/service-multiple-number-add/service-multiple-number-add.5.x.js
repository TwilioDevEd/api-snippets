// Download the Node helper library from twilio.com/docs/libraries/node
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);
const service = client.messaging.services('MG2172dd2db502e20dd981ef0d67850e1a');

const phoneNumbers = [
  'PN2a0747eba6abf96b7e3c3ff0b4530f6e',
  'PN557ce644e5ab84fa21cc21112e22c485',
  'PN2a0747eba6abf96b7e3c3ff0b4530f6e',
];

phoneNumbers.forEach(phoneNumber => {
  service.phoneNumbers
    .create({ phoneNumberSid: phoneNumber })
    .then(response => {
      console.log(response);
    })
    .catch(error => {
      console.log(error);
    });
});
