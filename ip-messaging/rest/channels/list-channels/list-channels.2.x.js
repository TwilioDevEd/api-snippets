let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let IpMessagingClient = require('twilio').IpMessagingClient;

let client = new IpMessagingClient(accountSid, authToken);
let service = client.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.channels
  .list()
  .then(function(response) {
    console.log(response);
  })
  .fail(function(error) {
    console.log(error);
  });
