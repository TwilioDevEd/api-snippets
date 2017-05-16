var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.documents('MyFirstDocument')
  .documentPermissions('bob').update({
    read: 'true',
    write: 'true',
    manage: 'false'
  }).then(function(response) {
    console.log(response);
  }).catch(function(error) {
    console.log(error);
  });
