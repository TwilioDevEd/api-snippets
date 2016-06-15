// Download the **Next-Gen** twilio-node library from:
// twilio.com/docs/libraries/node#installation-nextgen
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; // Your Account SID from www.twilio.com/console
var authToken = 'your_auth_token';   // Your Auth Token from www.twilio.com/console

var twilioLibrary = require('twilio');
var client = new twilioLibrary.Twilio(accountSid, authToken);

client.preview.wireless.commands('DCcb6aa7c620874dd98ba6c9c4108d0ed0')
  .fetch(function(err, cmd) {
	console.log(cmd);
});
