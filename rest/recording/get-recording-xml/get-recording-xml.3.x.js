// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let recordingId = 'RE557ce644e5ab84fa21cc21112e22c485';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

let promise = client.api.v2010
  .accounts(accountSid)
  .recordings(recordingId)
  .fetch();
promise.then(function(response) {
  console.log(response);
});
