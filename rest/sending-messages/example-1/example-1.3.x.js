// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    body: 'Jenny please?! I love you <3',
    to: '+15558675309',
    from: '+14158141829',
    mediaUrl: 'http://www.example.com/hearts.png',
  })
  .then(message => process.stdout.write(message.sid));
