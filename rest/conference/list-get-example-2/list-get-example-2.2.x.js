// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.conferences.list(
  {
    status: 'in-progress',
    friendlyName: 'MyRoom',
  },
  (err, data) => {
    data.conferences.forEach(conference => {
      console.log(conference.Status);
    });
  }
);
