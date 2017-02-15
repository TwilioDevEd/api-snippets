// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const notificationSid = 'NO5a7a84730f529f0a76b3e30c01315d1a';

client.notifications(notificationSid)
  .remove()
  .then(() => console.log(`Sid ${notificationSid} deleted successfully.`))
  .catch((err) => console.log(err.status));
