// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC1365ff479ef6502d85c27be6467a310c';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.accounts("AC1365ff479ef6502d85c27be6467a310c").update({
    status: "active"
}, function(err, account) {
    console.log(account.status);
});