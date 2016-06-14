// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var MonitorClient = require('twilio').MonitorClient;
var client = new MonitorClient(accountSid, authToken);

var params = {
    resourceSid: "PN4aa51b930717ea83c91971b86d99018f"
};
client.events.list(params, function(error, events) {
    for (var e in events) {
        process.stdout.write(e.description);
    }
});
