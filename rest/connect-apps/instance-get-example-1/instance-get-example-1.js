// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.connectApps("CNb989fdd207b04d16aee578018ef5fd93").get(function(err, connectApp) {
    console.log(connectApp.homepageUrl);
});