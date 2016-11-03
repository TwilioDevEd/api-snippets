// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls
  .create({
    url: 'http://www.example.com/sipdial.xml',
    to: 'sip:kate@example.com?hatchkey=4815162342',
    from: 'Jack',
  })
  .then((call) => process.stdout.write(call.sid));
