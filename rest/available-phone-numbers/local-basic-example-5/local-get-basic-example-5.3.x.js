// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .availablePhoneNumbers('GB')
  .local.list({
    contains: ' 4420',
  })
  .then(availablePhoneNumbers => {
    const number = availablePhoneNumbers[0];
    return client.incomingPhoneNumbers.create({
      phoneNumber: number.phoneNumber,
    });
  })
  .then(purchasedNumber => console.log(purchasedNumber.sid));
