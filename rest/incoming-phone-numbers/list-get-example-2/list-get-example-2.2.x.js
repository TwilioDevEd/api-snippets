// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var client = require('twilio')(accountSid, authToken);

client.incomingPhoneNumbers.list(
  {
    phoneNumber: '+14158675309',
  },
  function(err, data) {
    data.incomingPhoneNumbers.forEach(function(number) {
      console.log(number.phoneNumber);
    });
  }
);
