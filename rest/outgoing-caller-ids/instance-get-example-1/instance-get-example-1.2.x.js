// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client
  .outgoingCallerIds('PNe905d7e6b410746a0fb08c57e5a186f3')
  .get(function(err, callerId) {
    console.log(callerId.phoneNumber);
  });
