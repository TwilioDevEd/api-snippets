// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio');
const client = new Twilio(accountSid, authToken);

client.api.calls
  .create({
    url: 'http://demo.twilio.com/docs/voice.xml',
    to: '+14155551212',
    from: '+15017250604',
  })
  .then(call => console.log(call.sid));
