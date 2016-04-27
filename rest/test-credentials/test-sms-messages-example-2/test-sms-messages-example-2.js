// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.sms.messages.create({
    body: "Hey Mr Nugget, you the bomb!",
    to: "+15005550009",
    from: "+15005550006"
}, function(err, sms) {
    process.stdout.write(sms.sid);
});