// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC228ba32a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.outgoingCallerIds.create({
    friendlyName: "My Home Phone Number",
    phoneNumber: "+14158675309"
}, function(err, callerId) {
    process.stdout.write(callerId.sid);
});