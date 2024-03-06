// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.addresses
  .create({
    customerName: 'Customer 500',
    street: 'Elm Street',
    city: 'Racoon',
    region: 'Mordor',
    postalCode: '150',
    isoCountry: 'AX',
  })
  .then(address => console.log(address.customerName));
