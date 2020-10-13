// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.api
  .accounts(accountSid)
  .outgoingCallerIds('PNe905d7e6b410746a0fb08c57e5a186f3')
  .fetch()
  .then(callerId => console.log(callerId.phoneNumber));
