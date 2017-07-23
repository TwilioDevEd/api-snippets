// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var apnCredentialSid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var fcmCredentialSid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var Twilio = require('twilio');

var client = new Twilio(
  accountSid,
  apnCredentialSid,
  fcmCredentialSid,
  authToken
);

client.notify.services
  .create({
    friendlyName: 'My Awesome Service',
  })
  .then(function(service) {
    console.log(service.friendlyName);
  })
  .catch(function(error) {
    console.log(error);
  })
  .done();
