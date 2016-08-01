// Twilio Credentials 
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
var authToken = '[AuthToken]'; 
 
//require the Twilio module and create a REST client 
var client = require('twilio')(accountSid, authToken); 
 
client.messages.create({ 
    to: "+16518675309", 
    from: "+14158141829", 
    body: "Hey Jenny! Good luck on the bar exam!", 
}, function(err, message) { 
    console.log(message.sid); 
});