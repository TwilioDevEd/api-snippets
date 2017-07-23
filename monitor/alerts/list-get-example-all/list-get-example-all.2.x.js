// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var MonitorClient = require('twilio').MonitorClient;
var client = new MonitorClient(accountSid, authToken);

client.alerts.list(function(err, data) {
  data.alerts.forEach(function(alert) {
    console.log(alert.alertText);
  });
});
