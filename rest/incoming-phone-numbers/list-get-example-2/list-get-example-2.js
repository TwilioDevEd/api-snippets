// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACdc5f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers.list({ 
  phoneNumber: "+14158675309" 
}, function(err, data) {
    data.numbers.forEach(function(number) {
        console.log(number.phoneNumber);
    });
});