// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.calls.create(
  {
    url: 'http://demo.twilio.com/docs/voice.xml',
    to: 'client:tommy',
    from: '+15017250604',
  },
  function(err, call) {
    process.stdout.write(call.sid);
  }
);
