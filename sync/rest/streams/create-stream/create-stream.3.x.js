const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.syncStreams
  .create({
    uniqueName: 'MyStream',
    ttl: 1814400
  })
  .then(stream => {
    console.log(stream.sid);
  })
  .catch(error => {
    console.log(error);
  });
