// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.messages.create(
  {
    body: "Let's grab lunch at Milliways tomorrow!",
    to: '+15558675310',
    from: '+14158141829',
    mediaUrl: 'http://www.example.com/cheeseburger.png',
  },
  (err, message) => {
    process.stdout.write(message.sid);
  }
);
