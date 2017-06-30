// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.api.accounts(accountSid)
  .outgoingCallerIds('PNe536d32a3c49700934481addd5ce1659')
  .update({friendlyName: 'My Second Line'})
  .then((callerId) => console.log(callerId.phoneNumber));
