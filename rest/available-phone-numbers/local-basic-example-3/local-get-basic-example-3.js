// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.availablePhoneNumbers("US").local.list({ 
    contains: "STORM" 
}, function(err, data) {
    for (var number in data.availablePhoneNumbers) {
        client.incomingPhoneNumbers.create({
            phoneNumber: number.phone_number
        }, function(err, purchasedNumber) {
            console.log(purchasedNumber.sid);
        });
    }
});