var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);

client.chat.credentials('CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update({
    friendlyName: 'My other credential'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
