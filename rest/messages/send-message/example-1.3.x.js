// Twilio Credentials
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    to: '+15558675309',
    from: '+15017250604',
    body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
    mediaUrl: 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
  })
  .then(message => console.log(message.sid));
