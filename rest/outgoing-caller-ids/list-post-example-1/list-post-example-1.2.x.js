// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Client = require('twilio').RestClient;

const client = new Client(accountSid, authToken);

client.validationRequests.create(
  {
    friendlyName: 'My Home Phone Number',
    phoneNumber: '+14158675309',
  },
  (err, data) => {
    if (err) {
      console.error(err);
    } else {
      console.log(data.validationCode);
    }
  }
);
