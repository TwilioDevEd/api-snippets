// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.sip
  .credentialLists('CL32a3c49700934481addd5ce1659f04d2')
  .credentials.list(function(err, data) {
    data.credentials.forEach(function(credential) {
      console.log(credential.Username);
    });
  });
