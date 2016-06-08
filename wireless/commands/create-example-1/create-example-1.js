// Download the **Next-Gen** twilio-node library from:
// twilio.com/docs/libraries/node#installation-nextgen
var accountSid = '{{ account_sid }}'; // Your Account SID from twilio.com/console
var authToken = '{{ auth_token }}';   // Your Auth Token from twilio.com/console

var twilioLibrary = require('twilio');
var client = new twilioLibrary.Twilio(accountSid, authToken);

client.preview.wireless.commands.create({
  device: '524116518656369',
  command: 'wakeup',
  callbackUrl: 'https://devicemanager.mycompany.com/devices/524116518656369/commands'
});