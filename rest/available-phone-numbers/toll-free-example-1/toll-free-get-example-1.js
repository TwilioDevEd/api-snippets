// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACde6f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.availablePhoneNumbers("US").tollFree.list({  }, function(err, data) {
    for (var number in data.availablePhoneNumbers) {
        client.incomingPhoneNumbers.create({
            phoneNumber: number.phone_number
        }, function(err, purchasedNumber) {
            console.log(purchasedNumber.sid);
        });
    }
});