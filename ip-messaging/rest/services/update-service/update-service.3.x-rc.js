var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);

client.chat.services('SERVICE_SID').update({
    friendlyName: 'My new Chat service'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
