const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.documents
  .create({
    uniqueName: 'MyFirstDocument',
    data: { firstName: 'Alice' },
    ttl: 1814400 // expires in 21 days
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
