// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.messages.create(
  {
    body: 'All in the game, yo',
    to: '+14108675310',
    from: '+15005550006',
  },
  (err, sms) => {
    process.stdout.write(sms.sid);
  }
);
