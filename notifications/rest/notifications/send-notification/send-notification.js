var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = '{{ auth_token }}';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

var service = client.notifications.v1.services('ISxxx');

service.notifications.create({
  'identity':'Bob',
  'body':'Hello Bob'
}).then(function(response) {
  console.log(response);
}).catch(function(error) {
  console.log(error);
});