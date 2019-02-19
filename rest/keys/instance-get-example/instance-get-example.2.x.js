// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.keys('SK2a0747eba6abf96b7e3c3ff0b4530f6e').get((err, key) => {
  console.log(key.friendlyName);
});
