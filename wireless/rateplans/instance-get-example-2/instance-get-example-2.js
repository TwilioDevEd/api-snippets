// Download the **Next-Gen** twilio-node library from:
// twilio.com/docs/libraries/node#installation-nextgen
var accountSid = '{{ account_sid }}'; // Your Account SID from www.twilio.com/console
var authToken = '{{ auth_token }}';   // Your Auth Token from www.twilio.com/console

var twilioLibrary = require('twilio');
var client = new twilioLibrary.Twilio(accountSid, authToken);

client.preview.wireless.ratePlans('us-automotive')
  .fetch(function(err, plan) {
	console.log(plan);
});
