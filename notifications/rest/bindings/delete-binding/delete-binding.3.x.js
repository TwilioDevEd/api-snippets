// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const Twilio = require('twilio');

const client = new Twilio(accountSid, authToken);

const service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .remove()
  .then(function(wasRemoved) {
    console.log(wasRemoved);
  })
  .catch(function(error) {
    console.log(error);
  })
  .done();
