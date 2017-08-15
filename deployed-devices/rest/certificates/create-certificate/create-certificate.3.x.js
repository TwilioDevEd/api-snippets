const fs = require('fs');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const fleet = client.preview.deployed_devices.fleets('FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

fleet.certificates
  .create({
    deviceSid: 'THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    certificateData: fs.readFileSync('/path/to/certificate.pem')
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
