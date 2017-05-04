var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'AUTH_TOKEN';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);
var service = client.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.channels('CHANNEL_SID').messages.create({
    body: 'MESSAGE'
}).then(function(response) {
    console.log(response);
}).fail(function(error) {
    console.log(error);
});
