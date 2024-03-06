// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const notificationSid = 'NO5a7a84730f529f0a76b3e30c01315d1a';

client
  .notifications(notificationSid)
  .remove()
  .then(() => console.log(`Sid ${notificationSid} deleted successfully.`))
  .catch(err => console.log(err.status));
