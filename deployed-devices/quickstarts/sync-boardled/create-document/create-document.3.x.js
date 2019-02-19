const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('default');

service.documents
  .create({
    uniqueName: 'BoardLED',
    data: { led: 'OFF' },
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
