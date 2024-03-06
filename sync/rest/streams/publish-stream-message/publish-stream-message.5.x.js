// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
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
