// Download the **Next-Gen** twilio-node library from:
// twilio.com/docs/libraries/node#installation-nextgen
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; // Your Account SID from twilio.com/console
var authToken = 'your_auth_token';   // Your Auth Token from twilio.com/console

var twilioLibrary = require('twilio');
var client = new twilioLibrary.Twilio(accountSid, authToken);

client.preview.wireless.devices.create({
    alias: '996224413905003',
    friendlyName: "Charlie's SmartMeter",
    ratePlan: '{{ rate_plan_sid }}'
  }, function(err, result) {
    console.log(result);
});