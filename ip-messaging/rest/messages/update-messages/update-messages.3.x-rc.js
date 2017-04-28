var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.chat.services('SERVICE_SID');

service.channels('CHxx').messages('IMxx').update({
    body: 'New body content.'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
