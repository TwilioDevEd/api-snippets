// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const Twilio = require('twilio');
const client = new Twilio(accountSid, authToken);

client.api.calls
  .create({
    url: 'http://demo.twilio.com/docs/voice.xml',
    to: '+14155551212',
    from: '+15017122661',
  })
  .then(call => console.log(call.sid));
