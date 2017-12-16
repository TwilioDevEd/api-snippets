// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.sendMessage(
  {
    messagingServiceSid: 'MG9752274e9e519418a7406176694466fa',
    to: '+441632960675',
    body: 'Phantom Menace was clearly the best of the prequel trilogy.',
  },
  (err, message) => {
    console.log(message);
  }
);
