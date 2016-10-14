// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.availablePhoneNumbers("GB").mobile.list({}, function(err, data) {
  var number = data.availablePhoneNumbers[0];

  client.incomingPhoneNumbers.create({
    phoneNumber: number.phone_number
  }, function(err, purchasedNumber) {
    console.log(purchasedNumber.sid);
  });
});
