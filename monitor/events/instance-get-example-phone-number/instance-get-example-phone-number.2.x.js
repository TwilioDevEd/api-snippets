// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let MonitorClient = require('twilio').MonitorClient;
let client = new MonitorClient(accountSid, authToken);

client.events('AE21f24380625e4aa4abec76e39b14458d').get(function(error, event) {
  process.stdout.write(event.eventType);
});
