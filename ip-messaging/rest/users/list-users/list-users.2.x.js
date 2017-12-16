const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const IpMessagingClient = require('twilio').IpMessagingClient;

const client = new IpMessagingClient(accountSid, authToken);
const service = client.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.users
  .list()
  .then(response => {
    console.log(response);
  })
  .fail(error => {
    console.log(error);
  });
