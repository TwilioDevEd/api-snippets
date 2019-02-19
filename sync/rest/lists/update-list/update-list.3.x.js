const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.syncLists('MyFirstList')
  .update({
    ttl: 864000 // expires in 10 days
  })
  .then(list => {
    console.log(list.dateExpires);
  })
  .catch(error => {
    console.log(error);
  });
