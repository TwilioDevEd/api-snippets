let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let IpMessagingClient = require('twilio').IpMessagingClient;

let client = new IpMessagingClient(accountSid, authToken);

client.credentials
  .create({
    type: 'TYPE',
    apiKey: 'APIKEY',
    friendlyName: 'FRIENDLY_NAME',
  })
  .then(function(response) {
    console.log(response);
  })
  .fail(function(error) {
    console.log(error);
  });
