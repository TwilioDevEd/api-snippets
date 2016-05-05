// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers.list({ 
  phoneNumber: "867" 
  }, function(err, data) {
    data.numbers.forEach(function(number) {
        console.log(number.voiceUrl);
    });
});