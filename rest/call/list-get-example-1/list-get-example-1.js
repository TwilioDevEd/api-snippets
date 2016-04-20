// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC5ef877a5fe4238be081ea6f3c44186f3';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.calls.list(function(err, data) {
    data.calls.forEach(function(call) {
        console.log(call.Direction);
    });
});