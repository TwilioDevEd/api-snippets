// Get the Node helper library from https://twilio.com/docs/libraries/node
const fs = require('fs');
const Twilio = require('twilio').Twilio;

// Get your Account SID and Auth Token from https://twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = new Twilio(accountSid, authToken);

const fleetSid = process.env.TWILIO_FLEET_SID;
const fleetService = client.preview.deployed_devices.fleets(fleetSid);

fleetService.devices
  .create({
    friendlyName: 'My Device #1',
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
