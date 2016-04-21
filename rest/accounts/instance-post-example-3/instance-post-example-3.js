// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC12345678123456781234567812345678';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.accounts("AC12345678123456781234567812345678").update({
    status: "closed"
}, function(err, account) {
    console.log(account.dateCreated);
});