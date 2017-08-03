// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio');

const client = new Twilio(accountSid, authToken);

const service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

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
  .then(notification => {
    console.log(notification);
  })
  .catch(error => {
    console.log(error);
  })
  .done();
