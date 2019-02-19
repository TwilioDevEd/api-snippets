const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.syncStreams('MyStream')
  .update({
    ttl: 864000 // expires in 10 days
  })
  .then(stream => {
    console.log(stream.dateExpires);
  })
  .catch(error => {
    console.log(error);
  });
