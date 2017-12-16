// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls.create(
  {
    url: 'http://demo.twilio.com/docs/voice.xml',
    to: '+14155551212',
    from: '+18668675310',
    statusCallback: 'https://www.myapp.com/events',
    statusCallbackMethod: 'POST',
    statusCallbackEvent: ['initiated', 'ringing', 'answered', 'completed'],
    method: 'GET',
  },
  (err, call) => {
    console.log(call.sid);
  }
);
