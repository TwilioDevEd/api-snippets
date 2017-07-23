// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio');

let client = new Twilio(accountSid, authToken);
let service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.bindings
  .create({
    endpoint: 'endpoint_id',
    identity: '00000001',
    bindingType: 'apn',
    address: 'device_token',
    tag: ['premium', 'new user'],
  })
  .then(function(binding) {
    console.log(binding);
  })
  .catch(function(error) {
    console.log(error);
  });
