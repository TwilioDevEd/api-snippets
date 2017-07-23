// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const MonitorClient = require('twilio').MonitorClient;
const client = new MonitorClient(accountSid, authToken);

client.events('AE21f24380625e4aa4abec76e39b14458d').get((error, event) => {
  process.stdout.write(event.eventType);
});
