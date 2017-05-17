var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);

client.preview.sync.services.create({
  friendlyName: 'MySyncServiceInstance'
}).then(function(response) {
  console.log(response);
}).catch(function(error) {
  console.log(error);
});
