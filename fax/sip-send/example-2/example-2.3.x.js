// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'AC850685e1d9b8c09dae0b938923dc0d42';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.fax.v1.faxes.create({
  to: 'sip:kate@example.com',
  from: 'Jack',
  mediaUrl: 'https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf',
  sipAuthUsername: 'jack',
  sipAuthPassword: 'secret'
}).then(function(response) {
  console.log(response.sid);
}).catch((err) => {
  console.log(err)
});
