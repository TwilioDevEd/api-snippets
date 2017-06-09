// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.monitor.v1
  .events('AE21f24380625e4aa4abec76e39b14458d')
  .fetch()
  .then((data) => console.log(event.description));
