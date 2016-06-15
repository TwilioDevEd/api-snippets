// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var client = require('twilio')(accountSid, authToken);

client.usage.records.today.list({ category: "calls" }, function(err, data) {
    data.usageRecords.forEach(function(record) {
        console.log(record.count);
    });
});