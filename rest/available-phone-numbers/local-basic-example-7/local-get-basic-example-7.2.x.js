// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.availablePhoneNumbers('US').local.list({
  excludeAllAddressRequired: 'true',
}, (err, data) => {
  const number = data.availablePhoneNumbers[0];

  client.incomingPhoneNumbers.create(
    {
      phoneNumber: number.phone_number,
    },
    (err, purchasedNumber) => {
      console.log(purchasedNumber.sid);
    }
  );
});
