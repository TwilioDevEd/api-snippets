// Twilio Credentials 
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
var authToken = 'your_auth_token'; 
 
//require the Twilio module and create a REST client 
var client = require('twilio')(accountSid, authToken); 
 
// TODO: Confirm passing provideFeedback works
client.messages.create({ 
    to: "+15558675309", 
    from: "+15017250604", 
    body: "Open to confirm: http://yourserver.com/confirm?id=1234567890",
    provideFeedback: true
}, function(err, message) { 
    console.log(message.sid); 
});