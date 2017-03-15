// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    messagingServiceSid: 'MG9752274e9e519418a7406176694466fa',
    to: '+441632960675',
    body: 'Phantom Menace was clearly the best of the prequel trilogy.',
  })
  .then((message) => console.log(message));
