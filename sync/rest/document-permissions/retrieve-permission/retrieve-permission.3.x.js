var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.documents('MyFirstDocument')
  .documentPermissions('bob').fetch().then(function(response) {
    console.log(response);
  }).catch(function(error) {
    console.log(error);
  });
