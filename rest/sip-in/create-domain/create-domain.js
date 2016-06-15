// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.sip.domains.create({
    friendlyName: "My Domain",
    voiceUrl: "https://demo.twilio.com/welcome",
    authType: "IP_ACL",
    domainName: "marlo.sip.twilio.com"
}, function(err, domain) {
    process.stdout.write(domain.sid);
});