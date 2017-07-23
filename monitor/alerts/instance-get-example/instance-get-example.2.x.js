// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let MonitorClient = require('twilio').MonitorClient;
let client = new MonitorClient(accountSid, authToken);

client.alerts('NO5a7a84730f529f0a76b3e30c01315d1a').get(function(err, alert) {
  console.log(alert.alertText);
});
