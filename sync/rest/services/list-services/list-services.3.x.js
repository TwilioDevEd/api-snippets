let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio').Twilio;

let client = new Twilio(accountSid, authToken);

client.sync.services
  .list()
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
