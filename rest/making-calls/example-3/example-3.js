// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.calls.create({
    url: "http://demo.twilio.com/docs/voice.xml",
    to: "+14155551212",
    sendDigits: "1234#",
    from: "+18668675309",
    method: "GET"
}, function(err, call) {
    process.stdout.write(call.sid);
});