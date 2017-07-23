// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.messages.create(
  {
    to: '+14108675309',
    from: '+15005550006',
  },
  function(err, sms) {
    process.stdout.write(sms.sid);
  }
);
