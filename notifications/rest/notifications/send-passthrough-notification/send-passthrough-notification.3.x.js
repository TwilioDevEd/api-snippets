// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio');

let client = new Twilio(accountSid, authToken);

let service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.notifications
  .create({
    toBinding: [
      {
        binding_type: 'sms',
        address: '+15555555555',
      },
      {
        binding_type: 'facebook-messenger',
        address: '123456789123',
      },
    ],
    body: 'Hello Bob',
  })
  .then(function(notification) {
    console.log(notification);
  })
  .catch(function(error) {
    console.log(error);
  })
  .done();