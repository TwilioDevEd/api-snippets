// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .outgoingCallerIds('PNe905d7e6b410746a0fb08c57e5a186f3')
  .get((err, callerId) => {
    console.log(callerId.phoneNumber);
  });
