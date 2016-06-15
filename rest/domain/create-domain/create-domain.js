// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.sip.domains.create({
    friendlyName: "Scranton Office",
    voiceUrl: "https://dundermifflin.example.com/twilio/app.php",
    authType: "IP_ACL",
    domainName: "dunder-mifflin-scranton.sip.twilio.com"
}, function(err, domain) {
    process.stdout.write(domain.sid);
});