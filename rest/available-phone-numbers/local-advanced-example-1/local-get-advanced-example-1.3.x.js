// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.availablePhoneNumbers('US').local
  .list({
    nearLatLong: '37.840699,-122.461853',
    distance: '50',
    contains: '555',
    inRegion: 'CA',
  })
  .then((data) => {
    const number = data[0];
    return client.incomingPhoneNumbers.create({
      phoneNumber: number.phoneNumber,
    });
  })
  .then((purchasedNumber) => console.log(purchasedNumber.sid));
