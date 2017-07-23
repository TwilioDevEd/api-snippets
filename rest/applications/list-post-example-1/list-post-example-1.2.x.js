// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.applications.create(
  {
    friendlyName: 'Phone Me',
    voiceUrl: 'http://demo.twilio.com/docs/voice.xml',
    voiceMethod: 'GET',
  },
  function(err, app) {
    process.stdout.write(app.sid);
  }
);
