const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.syncMaps
  .create({
    uniqueName: 'Players',
    ttl: 1814400
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
