// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.authorizedConnectApps.list(function(err, data) {
  data.authorizedConnectApps.forEach(function(authorizedApp) {
    console.log(authorizedApp.connectAppHomepageUrl);
  });
});
