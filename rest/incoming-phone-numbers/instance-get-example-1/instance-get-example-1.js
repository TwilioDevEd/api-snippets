// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers("PN2a0747eba6abf96b7e3c3ff0b4530f6e").get(function(err, number) {
    console.log(number.phoneNumber);
});