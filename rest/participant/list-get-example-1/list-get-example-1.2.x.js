// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client
  .conferences('CFbbe4632a3c49700934481addd5ce1659')
  .participants.list(function(err, data) {
    data.participants.forEach(function(participant) {
      console.log(participant.Muted);
    });
  });
