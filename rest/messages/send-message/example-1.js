// Twilio Credentials 
var accountSid = '{{ account_sid }}'; 
var authToken = '[AuthToken]'; 
 
//require the Twilio module and create a REST client 
var client = require('twilio')(accountSid, authToken); 
 
client.messages.create({ 
    to: "+16518675309", 
    from: "+14158141829", 
    body: "Hey Jenny! Good luck on the bar exam!", 
    mediaUrl: "http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg",  
}, function(err, message) { 
    console.log(message.sid); 
});