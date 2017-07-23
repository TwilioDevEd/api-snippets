// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.keys.create(
  {
    friendlyName: 'User Jenny',
  },
  function(err, key) {
    process.stdout.write(key.sid);
    process.stdout.write(key.secret);
  }
);
