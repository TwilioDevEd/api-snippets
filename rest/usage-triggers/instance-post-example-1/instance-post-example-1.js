// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.usage.triggers("UT33c6aeeba34e48f38d6899ea5b765ad4").update({
    friendlyName: "Monthly Maximum Call Usage",
    callbackUrl: "https://www.example.com/monthly-usage-trigger"
}, function(err, trigger) {
    console.log(trigger.dateFired);
});