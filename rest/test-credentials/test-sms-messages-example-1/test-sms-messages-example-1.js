// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.sms.messages.create({
    body: "All in the game, yo",
    to: "+14108675309",
    from: "+15005550006"
}, function(err, sms) {
    process.stdout.write(sms.sid);
});