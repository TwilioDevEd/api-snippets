const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio').Twilio;

const client = new Twilio(accountSid, authToken);
const service = client.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .syncMaps('Players')
  .syncMapItems.create({
    key: 'steph_curry',
    data: {
      level: 30,
      name: 'Stephen Curry',
      username: 'spicy_curry',
    },
    ttl: 864000 // expires in 10 days
  })
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
