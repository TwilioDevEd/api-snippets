// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.calls("CAe1644a7eed5088b159577c5802d8be38").update({
    url: "http://demo.twilio.com/docs/voice.xml",
    method: "POST"
}, function(err, call) {
    console.log(call.to);
});