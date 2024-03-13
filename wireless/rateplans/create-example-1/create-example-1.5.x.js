// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.wireless.ratePlans
  .create({
    uniqueName: 'SmartMeterCA',
    friendlyName: 'California SmartMeter Plan',
    dataLimit: 5,
    messagingEnabled: 'true',
  })
  .then(response => {
    console.log(response);
  });
