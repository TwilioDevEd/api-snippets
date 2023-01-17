// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.api
  .accounts(accountSid)
  .outgoingCallerIds // filter callerids to include only those that have the following number
  .each({ phoneNumber: '+12349013030' }, callerId => console.log(callerId.sid));
