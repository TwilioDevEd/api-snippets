// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.addresses
  .create({
    friendlyName: 'Billing - Customer 123',
    customerName: 'Customer 123',
    street: '1 Hasselhoff Lane',
    city: 'Berlin',
    region: 'Berlin',
    postalCode: '10875',
    isoCountry: 'DE',
  })
  .then(address => console.log(address.customerName));
