// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
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
