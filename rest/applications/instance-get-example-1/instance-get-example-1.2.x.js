// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client
  .applications('AP2a0747eba6abf96b7e3c3ff0b4530f6e')
  .get(function(err, app) {
    console.log(app.smsUrl);
  });
