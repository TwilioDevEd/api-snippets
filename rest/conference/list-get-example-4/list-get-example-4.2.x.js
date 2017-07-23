// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.conferences.list(
  {
    status: 'in-progress',
    'dateCreated>': '2009-07-06',
  },
  function(err, data) {
    data.conferences.forEach(function(conference) {
      console.log(conference.Status);
    });
  }
);
