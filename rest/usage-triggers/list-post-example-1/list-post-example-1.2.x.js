// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.usage.triggers.create(
  {
    triggerValue: '1000',
    usageCategory: 'sms',
    callbackUrl: 'http://www.example.com/',
  },
  (err, trigger) => {
    process.stdout.write(trigger.sid);
  }
);
