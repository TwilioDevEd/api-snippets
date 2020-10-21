// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers
  .create({
    voiceUrl: 'http://demo.twilio.com/docs/voice.xml',
    phoneNumber: '+15005550006',
  })
  .then(number => process.stdout.write(number.sid));
