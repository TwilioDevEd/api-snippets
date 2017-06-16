// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

var service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
  .then(function(binding) {
    console.log(binding);
  }).catch(function(error) {
    console.log(error);
  })
  .done();
