// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.fax.v1.faxes
  .create({
      to: '+15558675309',
      from: '+15017250604',
      mediaUrl: 'https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf'
  }).then(function(response) {
    console.log(response.sid);
  }).catch((err) => {
    console.log(err)
  });
