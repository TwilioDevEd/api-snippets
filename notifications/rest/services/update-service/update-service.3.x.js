// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio');

let client = new Twilio(accountSid, authToken);

client.notify
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .update({
    friendlyName: 'Another Awesome Service',
    FacebookMessengerPageId: 'your_page_id',
    MessagingServiceSid: 'your_twilio_messaging_service_sid',
  })
  .then(function(service) {
    console.log(service.friendlyName);
  })
  .catch(function(error) {
    console.log(error);
  })
  .done();
