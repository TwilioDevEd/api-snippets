// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update({
  status: 'suspended',
}, function(err, account) {
  console.log(account.dateCreated);
});
