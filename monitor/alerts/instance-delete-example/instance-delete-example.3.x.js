// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.monitor.v1.alerts('NO5a7a84730f529f0a76b3e30c01315d1a').remove()
  .then((data) =>
    console.log('Sid NO5a7a84730f529f0a76b3e30c01315d1a deleted successfully.'))
  .catch((error) => console.log(error));
