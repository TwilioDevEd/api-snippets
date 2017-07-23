// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.recordings.list(
  {
    'dateCreated<': '2016-10-15',
    'dateCreated>': '2016-10-12',
  },
  function(err, data) {
    data.recordings.forEach(function(recording) {
      console.log(recording.Duration);
    });
  }
);
