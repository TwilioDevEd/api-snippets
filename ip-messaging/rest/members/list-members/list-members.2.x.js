var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var IpMessagingClient = require('twilio').IpMessagingClient;

var client = new IpMessagingClient(accountSid, authToken);
var service = client.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .members.list()
  .then(function(response) {
    console.log(response);
  })
  .fail(function(error) {
    console.log(error);
  });
