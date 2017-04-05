// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);
var service = client.notifications.services('ISxxx');

// Create a binding for a user that will be updated when details for Rogue
// One or the Han Solo spinoff are revealed
service.bindings
  .create({
    endpoint: 'your_user@example.com:sms',
    identity: 'your_user@example.com',
    bindingType: 'sms',
    address: '+16516667788',
    tag: ['rogue_one', 'han_solo_spinoff']
  }).then(function(response) {
    console.log(response);
  }).catch(function(error) {
    console.log(error);
  })
  .done();
