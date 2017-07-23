// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var client = require('twilio')(accountSid, authToken);

client.sip.credentialLists.create(
  {
    friendlyName: 'Low Rises',
  },
  function(err, credentialList) {
    process.stdout.write(credentialList.sid);
  }
);
