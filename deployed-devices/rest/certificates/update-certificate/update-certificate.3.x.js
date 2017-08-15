const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const fleet = client.preview.deployed_devices.fleets('FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

fleet
  .certificates('CYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    friendlyName: 'My New Certificate',
    deviceSid: 'THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
