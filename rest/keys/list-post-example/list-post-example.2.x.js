// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.keys.create(
  {
    friendlyName: 'User Joey',
  },
  (err, key) => {
    process.stdout.write(key.sid);
    process.stdout.write(key.secret);
  }
);
