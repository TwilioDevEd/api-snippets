// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.conferences('CFbbe46ff1274e283f7e3ac1df0072ab39')
  .fetch()
  .then((conference) => console.log(conference.status));
