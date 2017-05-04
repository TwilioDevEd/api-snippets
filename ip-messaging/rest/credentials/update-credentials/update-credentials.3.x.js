var accountSid = 'ACCOUNT_SID';
var authToken = 'AUTH_TOKEN';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);

client.chat.credentials('CRxx').update({
    friendlyName: 'My other credential'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});
