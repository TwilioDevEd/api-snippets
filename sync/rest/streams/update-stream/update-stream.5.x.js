// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
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
