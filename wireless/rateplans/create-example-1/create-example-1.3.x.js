// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.preview.wireless.ratePlans
  .create({
    uniqueName: 'SmartMeterCA',
    friendlyName: 'California SmartMeter Plan',
    dataLimit: 5,
    messagingEnabled: 'true',
  })
  .then(response => {
    console.log(response);
  });
