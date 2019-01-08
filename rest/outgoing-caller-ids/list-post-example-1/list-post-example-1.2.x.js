// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Client = require('twilio').RestClient;

const client = new Client(accountSid, authToken);

client.outgoingCallerIds.create(
  {
    friendlyName: 'My Home Phone Number',
    phoneNumber: '+12349013030',
  },
  (err, callerId) => {
    if (err) {
      console.error(err);
    } else {
      console.log(callerId.sid);
    }
  }
);
