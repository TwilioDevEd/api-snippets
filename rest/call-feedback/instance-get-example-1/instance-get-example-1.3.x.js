// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .calls('CA42ed11f93dc08b952027ffbc406d0868')
  .feedback()
  .fetch()
  .then(feedback => console.log(feedback.dateCreated));
