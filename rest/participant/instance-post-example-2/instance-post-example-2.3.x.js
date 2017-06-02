// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.conferences('CF203597f9bc241da2c1e9387946b89a63')
  .participants('CA386025c9bf5d6052a1d1ea42b4d16662')
  .update({hold: 'true', holdUrl: 'www.myapp.com/hold'})
  .then((participant) => console.log(participant.hold));
