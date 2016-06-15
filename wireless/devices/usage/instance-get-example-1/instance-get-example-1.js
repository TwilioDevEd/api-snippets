// Download the **Next-Gen** twilio-node library from:
// twilio.com/docs/libraries/node#installation-nextgen
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; // Your Account SID from www.twilio.com/console
var authToken = 'your_auth_token';   // Your Auth Token from www.twilio.com/console

var twilioLibrary = require('twilio');
var client = new twilioLibrary.Twilio(accountSid, authToken);

client.preview.wireless.devices('DEb8eff34b248d066a31c4a953134e183e')
  .usage().fetch(function(err, usage) {
    console.log(usage.period.start);
    console.log(usage.period.end);
    console.log(usage.dataCosts.total);
  });