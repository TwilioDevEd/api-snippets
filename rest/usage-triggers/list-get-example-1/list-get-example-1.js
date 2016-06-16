// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.usage.triggers.list({ recurring: "daily",
    usageCategory: "calls" }, function(err, data) {
    data.usageTriggers.forEach(function(trigger) {
        console.log(trigger.currentValue);
    });
});