// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACda6f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var MonitorClient = require('twilio').MonitorClient;
var client = new MonitorClient(accountSid, authToken);

client.alerts("NO5a7a84730f529f0a76b3e30c01315d1a").delete(function(err, data) {
    if (err) {
        console.log(err.status);
        throw err.message;
    } else {
        console.log("Sid NO5a7a84730f529f0a76b3e30c01315d1a deleted successfully.");
    }
});
