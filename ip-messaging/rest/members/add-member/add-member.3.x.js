var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.chat.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').members.create({
    identity: "Bob"
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
