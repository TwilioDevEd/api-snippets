var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);

client.chat.services.list().then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
