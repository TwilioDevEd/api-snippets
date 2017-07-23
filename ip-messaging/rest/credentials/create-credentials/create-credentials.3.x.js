let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio').Twilio;

let client = new Twilio(accountSid, authToken);

client.chat.credentials
  .create({
    type: 'gcm',
    apiKey: '1234',
    friendlyName: 'My credential',
  })
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
