// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = '{{ account_sid }}';
var authToken = '{{ auth_token }}';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);
var service = client.notifications.v1.services('ISxxx');

// Send a notification to all users who have subscribed for Rogue One updates
service.notifications.create({
  tag: 'rogue_one', 
  body: 'A new Rogue One trailer has been released!',
  sms: JSON.stringify({
    from: '+16516667788' // a Twilio number in your account
  })
}).then(function(response) {
  console.log(response);
}).catch(function(error) {
  console.log(error);
});
