// Download the Node helper library from twilio.com/docs/library/node
// These are your Account Sid and Auth Token from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.lookups.v1.phoneNumbers('+4402077651182').fetch()
  .then((number) => console.log(number.nationalFormat));
