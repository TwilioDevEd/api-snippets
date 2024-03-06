// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client
  .incomingPhoneNumbers('PN2a0747eba6abf96b7e3c3ff0b4530f6e')
  .fetch()
  .then(number => console.log(number.phoneNumber));
