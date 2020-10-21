// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client
  .availablePhoneNumbers('US')
  .local.list({
    nearLatLong: '37.840699,-122.461853',
    distance: '50',
    contains: '555',
    inRegion: 'CA',
  })
  .then(data => {
    const number = data[0];
    return client.incomingPhoneNumbers.create({
      phoneNumber: number.phoneNumber,
    });
  })
  .then(purchasedNumber => console.log(purchasedNumber.sid));
