// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACda6f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var MonitorClient = require('twilio').MonitorClient;
var client = new MonitorClient(accountSid, authToken);

client.alerts.list(function(err, data) {
    data.alerts.forEach(function(alert) {
        console.log(alert.alertText);
    });
});
