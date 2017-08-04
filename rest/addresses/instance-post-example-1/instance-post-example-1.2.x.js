// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.addresses('AD2a0747eba6abf96b7e3c3ff0b4530f6e').post({
  customerName: 'Customer 456',
  street: '2 Hasselhoff Lane',
}, (err, address) => {
  console.log(address.customerName);
});
