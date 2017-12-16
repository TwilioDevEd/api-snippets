const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const IpMessagingClient = require('twilio').IpMessagingClient;

const client = new IpMessagingClient(accountSid, authToken);

client
  .credentials('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    type: 'TYPE',
  })
  .then(response => {
    console.log(response);
  })
  .fail(error => {
    console.log(error);
  });
