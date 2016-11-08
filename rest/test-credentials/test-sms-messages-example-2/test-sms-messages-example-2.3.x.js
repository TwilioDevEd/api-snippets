// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    body: 'Hey Mr Nugget, you the bomb!',
    to: '+15005550009',
    from: '+15005550006',
  })
  .then((sms) => process.stdout.write(sms.sid));
