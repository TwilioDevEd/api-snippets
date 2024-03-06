// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const recordingId = 'RE557ce644e5ab84fa21cc21112e22c485';
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const promise = client.api.v2010
  .accounts(accountSid)
  .recordings(recordingId)
  .fetch();
promise.then(response => {
  console.log(response);
});
