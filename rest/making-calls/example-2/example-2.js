// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.calls.create({
    url: "http://demo.twilio.com/docs/voice.xml",
    to: "client:tommy",
    from: "+14158675309"
}, function(err, call) {
    process.stdout.write(call.sid);
});