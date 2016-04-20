// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACed732a3c49700934481addd5ce1659f0';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.usage.records.daily.list({ category: "calls-inbound",
    startDate: "2012-09-01",
    endDate: "2012-09-30" }, function(err, data) {
    data.records.forEach(function(record) {
        console.log(record.Price);
    });
});