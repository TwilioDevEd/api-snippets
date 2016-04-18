var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);

client.services('SERVICE_SID').create({
    friendlyName: 'friendly_name'
}).then(function(response) {
    console.log(response);
}).fail(function(error) {
    console.log(error);
});