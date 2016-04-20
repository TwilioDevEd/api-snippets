// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACda6f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.media.list({ parentSid: "MMdc5f132a3c49700934481addd5ce1659" }, function(err, data) {
    data.medias.forEach(function(media) {
        console.log(media.ContentType);
    });
});