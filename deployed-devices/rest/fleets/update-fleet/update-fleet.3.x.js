const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);

client.sync
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    friendlyName: 'My New Fleet of Devices',
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
