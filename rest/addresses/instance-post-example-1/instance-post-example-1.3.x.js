// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.addresses('AD2a0747eba6abf96b7e3c3ff0b4530f6e')
  .update({
    customerName: 'Customer 456',
    street: '2 Hasselhoff Lane',
  })
  .then((address) => console.log(address.customerName));
