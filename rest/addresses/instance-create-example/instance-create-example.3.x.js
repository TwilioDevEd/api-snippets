// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.addresses
  .create({
    customerName: 'FriendlyName',
    street: 'Elm Street',
    city: 'Racoon',
    region: 'Mordor',
    postalCode: '150',
    isoCountry: 'AX',
  })
  .then(address => console.log(address.customerName));
