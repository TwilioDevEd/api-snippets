// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.conferences.list(
  {
    status: 'completed',
    dateCreated: '2009-07-06',
  },
  (err, data) => {
    data.conferences.forEach(conference => {
      console.log(conference.Status);
    });
  }
);
