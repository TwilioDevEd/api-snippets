const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .syncStreams('MyStream')
  .streamMessages.create({
    data: {
      id: 'bob',
      x: 256,
      y: 42,
    },
  })
  .then(message => {
    console.log(message.sid);
  })
  .catch(error => {
    console.log(error);
  });
