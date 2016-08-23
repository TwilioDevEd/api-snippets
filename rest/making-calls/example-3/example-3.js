// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{#accountSid}}{{accountSid}}{{/accountSid}}';
var authToken = "{{#authToken}}{{authToken}}{{/authToken}}";
var client = require('twilio')(accountSid, authToken);

client.calls.create({
    url: "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}",
    to: "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    sendDigits: "{{#sendDigits}}{{sendDigits}}{{/sendDigits}}",
    from: "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    method: "{{#getHttpMethod}}{{getHttpMethod}}{{/getHttpMethod}}"
}, function(err, call) {
    process.stdout.write(call.sid);
});