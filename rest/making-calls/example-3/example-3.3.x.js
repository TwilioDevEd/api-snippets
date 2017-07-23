// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls
  .create({
    url: 'http://demo.twilio.com/docs/voice.xml',
    to: '+14155551212',
    sendDigits: '1234#',
    from: '+18668675309',
    method: 'GET',
  })
  .then(call => process.stdout.write(call.sid));
