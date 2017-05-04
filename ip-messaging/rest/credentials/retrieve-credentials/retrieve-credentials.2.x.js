var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'AUTH_TOKEN';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);

client.credentials('CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').get().then(function(response) {
    console.log(response);
}).fail(function(error) {
    console.log(error);
});