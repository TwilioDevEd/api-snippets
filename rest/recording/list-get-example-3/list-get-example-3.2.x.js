// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.recordings.list({ 'dateCreated>': '2009-07-06' }, function(err, data) {
  data.recordings.forEach(function(recording) {
    console.log(recording.CallSid);
  });
});
