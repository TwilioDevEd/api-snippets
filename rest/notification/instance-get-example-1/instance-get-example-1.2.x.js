// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client
  .notifications('NO5a7a84730f529f0a76b3e30c01315d1a')
  .get(function(err, notification) {
    console.log(notification.messageText);
  });
