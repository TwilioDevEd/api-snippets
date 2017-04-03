// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

var service = client.notify.services('ISxxx');

service.bindings('BSxxx').remove()
  .then(function(wasRemoved) {
    console.log(wasRemoved);
  }).catch(function(error) {
    console.log(error);
  })
  .done();
