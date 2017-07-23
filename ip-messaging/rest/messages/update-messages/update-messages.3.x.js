let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio').Twilio;

let client = new Twilio(accountSid, authToken);
let service = client.chat.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    body: 'New body content.',
  })
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
