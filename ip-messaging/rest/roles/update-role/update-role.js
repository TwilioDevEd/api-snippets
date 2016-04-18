var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);
var service = client.services('SERVICE_SID');

service.roles('ROLE_SID').post({
    friendlyName: 'RoleName',
    permission: 'sendMessage',
    permission: 'leaveChannel'
}).then(function(response) {
    console.log(response);
}).fail(function(error) {
    console.log(error);
});