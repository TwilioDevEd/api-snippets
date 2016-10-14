var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);
var service = client.services('SERVICE_SID');

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