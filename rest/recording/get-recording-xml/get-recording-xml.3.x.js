// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var recordingId = 'RE557ce644e5ab84fa21cc21112e22c485';
var authToken = 'your_auth_token';
var client = require('twilio')(accountSid, authToken);

var promise = client.api.v2010
  .accounts(accountSid)
  .recordings(recordingId)
  .fetch();
promise.then(function(response) {
  console.log(response);
});
