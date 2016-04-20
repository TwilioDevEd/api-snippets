// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACba8bc05eacf94afdae398e642c9cc32d';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.accounts("ACba8bc05eacf94afdae398e642c9cc32d").get(function(err, account) {
    console.log(account.dateCreated);
});