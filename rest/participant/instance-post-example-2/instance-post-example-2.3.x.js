// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio');
const client = new Twilio(accountSid, authToken);


client.api.accounts(accountSid)
  .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({hold: 'true', holdUrl: 'www.myapp.com/hold'})
  .then((participant) => console.log(participant.hold))
  .done();
