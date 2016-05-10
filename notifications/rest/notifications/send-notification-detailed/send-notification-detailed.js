var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = '{{ auth_token }}';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

var service = client.notifications.v1.services("ISxxx");

service.notifications.create({
    "identity":"Bob",
    "title":"Generic loooooooong title for all Bindings",
    "body":"This is the body for all Bindings",
    "gcm":'{"notification":{"tag":"MyTag"}}',
    "apn":'{"aps":{"title":"Short title for Watch."}}'
}).then(function(response) {
    console.log(response);
}).catch(function(error) {
    console.log(error);
});