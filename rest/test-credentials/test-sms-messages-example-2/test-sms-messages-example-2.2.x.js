// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.messages.create(
  {
    body: 'Hey Mr Nugget, you the bomb!',
    to: '+15005550009',
    from: '+15005550006',
  },
  function(err, sms) {
    process.stdout.write(sms.sid);
  }
);
