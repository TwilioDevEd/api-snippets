// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC32a3c49700934481addd5ce1659f04d2';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.sip.domains.create({
    friendlyName: "My Domain",
    voiceUrl: "https://demo.twilio.com/welcome",
    authType: "IP_ACL",
    domainName: "marlo.sip.twilio.com"
}, function(err, domain) {
    process.stdout.write(domain.sid);
});