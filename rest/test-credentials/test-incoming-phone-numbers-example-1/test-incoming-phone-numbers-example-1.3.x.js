// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers
  .create({
    voiceUrl: 'http://demo.twilio.com/docs/voice.xml',
    phoneNumber: '+15005550006',
  })
  .then(number => process.stdout.write(number.sid));
