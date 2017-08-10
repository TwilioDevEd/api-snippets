// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    body: 'All in the game, yo',
    to: '+14108675309',
    from: '+15005550006',
  })
  .then(sms => process.stdout.write(sms.sid));
