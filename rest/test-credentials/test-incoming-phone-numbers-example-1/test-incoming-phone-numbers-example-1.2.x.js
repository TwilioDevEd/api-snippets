// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers.create(
  {
    voiceUrl: 'http://demo.twilio.com/docs/voice.xml',
    phoneNumber: '+15005550006',
  },
  function(err, number) {
    process.stdout.write(number.sid);
  }
);
