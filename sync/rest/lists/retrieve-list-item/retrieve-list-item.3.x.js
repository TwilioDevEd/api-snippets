var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .syncLists('MyFirstList')
  .syncListItems(0)
  .fetch()
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
