// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const bindingOpts = {
  endpoint: 'endpoint_id',
  identity: '00000001',
  bindingType: 'apn',
  address: 'apn_device_token',
  tag: ['preferred device', 'new user']
};

client.notify
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .bindings.create(bindingOpts)
  .then(binding => console.log(binding.sid))
  .catch(error => console.log(error));
