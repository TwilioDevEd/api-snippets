// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC81e0ca4b0af06b833b6726957613c5d4';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.connectApps("CNb989fdd207b04d16aee578018ef5fd93").get(function(err, connectApp) {
    console.log(connectApp.homepageUrl);
});