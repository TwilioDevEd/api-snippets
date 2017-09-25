const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);

client.preview.deployed_devices.fleets
  .create({
    friendlyName: 'My Fleet of Devices',
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
