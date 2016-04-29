// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.sip.domains('SD32a3c49700934481addd5ce1659f04d2').credentialListMappings("CL32a3c49700934481addd5ce1659f04d2").delete(function(err, data) {
    if (err) {
        console.log(err.status);
        throw err.message;
    } else {
        console.log("Sid CL32a3c49700934481addd5ce1659f04d2 deleted successfully.");
    }
});