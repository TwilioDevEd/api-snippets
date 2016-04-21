// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC0132a3c49700934481addd5ce1659f04';
var authToken = '{{ auth_token }}';
var client = require('twilio')(accountSid, authToken);

var phoneNumber = client.accounts('AC00000000000000000000000000000001')
    .incomingPhoneNumbers('PN2a0747eba6abf96b7e3c3ff0b4530f6e');

phoneNumber.update({
    accountSid: "AC00000000000000000000000000000002"
}, function(err, number) {
    console.log(number);
});