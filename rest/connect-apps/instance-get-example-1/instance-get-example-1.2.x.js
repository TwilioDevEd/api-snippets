// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client
  .connectApps('CNb989fdd207b04d16aee578018ef5fd93')
  .get(function(err, connectApp) {
    console.log(connectApp.homepageUrl);
  });
