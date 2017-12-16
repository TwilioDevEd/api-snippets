const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.chat.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .remove()
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
