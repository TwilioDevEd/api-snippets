// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Client = require('twilio').RestClient;

let client = new Client(accountSid, authToken);

client.outgoingCallerIds.create(
  {
    friendlyName: 'My Home Phone Number',
    phoneNumber: '+14158675309',
  },
  function(err, callerId) {
    if (err) {
      console.error(err);
    } else {
      console.log(callerId.sid);
    }
  }
);
