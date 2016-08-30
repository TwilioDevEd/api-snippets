// Twilio Credentials 
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
var authToken = 'your_auth_token'; 
 
//require the Twilio module and create a REST client 
var client = require('twilio')(accountSid, authToken); 
 
client.messages.create({ 
    to: "+15558675309", 
    from: "+15017250604", 
    body: "Hey Jenny! Good luck on the bar exam!", 
}, function(err, message) { 
    console.log(message.sid); 
});