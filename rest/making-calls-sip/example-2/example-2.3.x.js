// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.calls
  .create({
    url: 'http://www.example.com/sipdial.xml',
    to: 'sip:kate@example.com',
    from: 'Jack',
    sipAuthPassword: 'secret',
    sipAuthUsername: 'jack',
  })
  .then(call => process.stdout.write(call.sid));
