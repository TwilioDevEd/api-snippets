// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .incomingPhoneNumbers('PN2a0747eba6abf96b7e3c3ff0b4530f6e')
  .update({
    accountSid: 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  })
  .then((number) => console.log(number));
