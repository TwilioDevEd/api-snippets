// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.availablePhoneNumbers('US').local.list({
  nearLatLong: '37.840699,-122.461853',
  distance: '50',
  contains: '555',
  inRegion: 'CA',
}, function(err, data) {
  const number = data.availablePhoneNumbers[0];

  client.incomingPhoneNumbers.create(
    {
      phoneNumber: number.phone_number,
    },
    function(err, purchasedNumber) {
      console.log(purchasedNumber.sid);
    }
  );
});
