var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.chat.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update({
    body: 'New body content.'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
