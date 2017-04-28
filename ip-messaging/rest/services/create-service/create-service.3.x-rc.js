var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);

client.chat.services.create({
    friendlyName: 'My Chat service'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
