// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACdc5f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers.create({
    friendlyName: "My Company Line",
    voiceUrl: "http://demo.twilio.com/docs/voice.xml",
    phoneNumber: "+15105647903",
    voiceMethod: "GET"
}, function(err, number) {
    console.log(number.sid);
});