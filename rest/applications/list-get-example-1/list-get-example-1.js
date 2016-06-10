// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.applications.list(function(err, data) {
    data.applications.forEach(function(app) {
        console.log(app.SmsUrl);
    });
});
