let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio').Twilio;

let client = new Twilio(accountSid, authToken);

client.chat
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    reachabilityEnabled: 'false',
  })
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });