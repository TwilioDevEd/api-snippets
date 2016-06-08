// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.usage.triggers.list({ recurring: "daily",
    usageCategory: "calls" }, function(err, data) {
    data.triggers.forEach(function(trigger) {
        console.log(trigger.CurrentValue);
    });
});