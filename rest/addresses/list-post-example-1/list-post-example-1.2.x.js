// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.addresses.create(
  {
    friendlyName: 'Billing - Customer 123',
    customerName: 'Customer 123',
    street: '1 Hasselhoff Lane',
    city: 'Berlin',
    region: 'Berlin',
    postalCode: '10875',
    isoCountry: 'DE',
  },
  (err, address) => {
    console.log(address.customerName);
  }
);
