var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.syncLists('MyFirstList')
  .syncListItems(0).update({
    data: JSON.stringify({
      number: "001",
      attack: "49",
      name: "Bulbasaur"
    })
  }).then(function(response) {
    console.log(response);
  }).catch(function(error) {
    console.log(error);
  });
