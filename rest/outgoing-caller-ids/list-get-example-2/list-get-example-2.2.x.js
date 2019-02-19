// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.outgoingCallerIds.list({ phoneNumber: '+12349013030' }, (err, data) => {
  data.outgoingCallerIds.forEach(callerId => {
    console.log(callerId.phoneNumber);
  });
});
