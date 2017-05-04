var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.chat.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages.create({
    body: 'New message'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
