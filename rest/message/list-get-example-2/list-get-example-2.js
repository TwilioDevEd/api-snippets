// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";

var client = require('twilio')(accountSid, authToken);

var filterOpts = {
    to: 'to_number',
    from: 'from_number',
    dateSent: new Date(2016, 0, 1)
};

client.messages.list(filterOpts, function(err, data) {
    data.forEach(function(message) {
        console.log(message.body);
    });
});
