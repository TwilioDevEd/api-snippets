var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);
var service = client.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.roles.create({
    friendlyName: 'role_name',
    type: 'deployment',
    permission: 'createChannel',
    permission: 'joinChannel'
}).then(function(response) {
    console.log(response);
}).fail(function(error) {
    console.log(error);
});