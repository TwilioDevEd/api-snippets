// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers.create(
  {
    friendlyName: 'My Company Line',
    voiceUrl: 'http://demo.twilio.com/docs/voice.xml',
    phoneNumber: '+15105647903',
    voiceMethod: 'GET',
  },
  function(err, number) {
    console.log(number.sid);
  }
);
