// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.applications.create(
  {
    friendlyName: 'Phone Me',
    voiceUrl: 'http://demo.twilio.com/docs/voice.xml',
    voiceMethod: 'GET',
  },
  (err, app) => {
    process.stdout.write(app.sid);
  }
);
