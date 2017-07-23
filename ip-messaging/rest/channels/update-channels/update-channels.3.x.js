var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio').Twilio;

var client = new Twilio(accountSid, authToken);
var service = client.chat.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    friendlyName: 'channel_name',
  })
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
