var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.chat.services('SERVICE_SID');

service.roles.create({
    friendlyName: 'My role name',
    type: 'deployment',
    permission: [ 'createChannel', 'joinChannel' ]
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
