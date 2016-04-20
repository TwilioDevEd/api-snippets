// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC5ef8732a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.conferences.list(function(err, data) {
    data.conferences.forEach(function(conference) {
        console.log(conference.Status);
    });
});