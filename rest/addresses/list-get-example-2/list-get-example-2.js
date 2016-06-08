// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.addresses.list({ customerName: "Customer 123" }, function(err, data) {
    data.addresses.forEach(function(address) {
        console.log(address.friendlyName);
    });
});
