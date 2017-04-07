// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

var service = client.notify.services('ISxxx');

service.notifications
  .create({
      identity:'00000001',
      title:'Generic loooooooong title for all Bindings',
      body:'This is the body for all Bindings',
      gcm:'{"notification":{"tag":"MyTag"}}',
      apn:'{"aps":{"title":"Short title for Watch."}}',
  }).then(function(notification) {
      console.log(notification);
  }).catch(function(error) {
      console.log(error);
  })
  .done()
