// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.conferences("CFbbe46ff1274e283f7e3ac1df0072ab39").get(function(err, conference) {
    console.log(conference.status);
});