// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.sms.shortCodes("SC6b20cb705c1e8f00210049b20b70fce2").get(function(err, shortCode) {
    console.log(shortCode.shortCode);
});