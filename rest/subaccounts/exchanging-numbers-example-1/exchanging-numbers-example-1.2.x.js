// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var client = require('twilio')(accountSid, authToken);

var phoneNumber = client.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    .incomingPhoneNumbers('PN2a0747eba6abf96b7e3c3ff0b4530f6e');

phoneNumber.update({
    accountSid: "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}, function(err, number) {
    console.log(number);
});