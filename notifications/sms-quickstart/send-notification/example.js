// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);
var service = client.notify.services('ISxxx');

// Send a notification to all users who have subscribed for Rogue One updates
service.notifications.create({
    identity: '00000001',
    body: 'Knok-Knok! This is your first Notify SMS'
  }).then(function(notification) {
    console.log(notification);
  }).catch(function(error) {
    console.log(error);
  })
  .done();
