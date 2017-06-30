// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.api.accounts(accountSid)
  .outgoingCallerIds('PNe905d7e6b410746a0fb08c57e5a186f3')
  .fetch()
  .then((callerId) => console.log(callerId.phoneNumber));
