// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .calls('CA42ed11f93dc08b952027ffbc406d0868')
  .feedback.get((err, feedback) => {
    console.log(feedback.dateCreated);
  });
