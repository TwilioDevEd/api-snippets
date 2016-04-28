// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC3094732a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var MonitorClient = require('twilio').MonitorClient;
var client = new MonitorClient(accountSid, authToken);

client.events.get("AE21f24380625e4aa4abec76e39b14458d", function(error, event) {
    process.stdout.write(event.description);
});
