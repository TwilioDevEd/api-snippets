// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

client.notify.v1.services.create({
  friendlyName: 'My Awesome Service'
}).then(function(response) {
  console.log(response);
}).catch(function(error) {
  console.log(error);
});