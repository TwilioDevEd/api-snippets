let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let IpMessagingClient = require('twilio').IpMessagingClient;

let client = new IpMessagingClient(accountSid, authToken);

client
  .credentials('CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .delete()
  .then(function(response) {
    console.log(response);
  })
  .fail(function(error) {
    console.log(error);
  });
