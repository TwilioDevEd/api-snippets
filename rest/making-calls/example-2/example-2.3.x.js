// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls.create({
  url: 'http://demo.twilio.com/docs/voice.xml',
  to: 'client:tommy',
  from: '+15017250604',
})
.then((call) => process.stdout.write(call.sid));
