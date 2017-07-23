const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.syncLists
  .create({
    uniqueName: 'MyFirstList',
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
