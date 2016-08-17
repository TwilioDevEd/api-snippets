// Twilio Credentials
var accountSid = '{{#accountSid}}{{accountSid}}{{/accountSid}}';
var authToken = '{{#authToken}}{{authToken}}{{/authToken}}';

//require the Twilio module and create a REST client
var client = require('twilio')(accountSid, authToken);

client.messages.create({
    to: "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    from: "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    body: "{{#messageBody}}{{messageBody}}{{/messageBody}}",
    mediaUrl: "{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}",
}, function(err, message) {
    console.log(message.sid);
});
