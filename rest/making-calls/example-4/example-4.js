// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{#accountSid}}{{accountSid}}{{/accountSid}}';
var authToken = "{{#authToken}}{{authToken}}{{/authToken}}";
var client = require('twilio')(accountSid, authToken);

client.calls.create({
    url: "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}",
    to: "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    from: "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}",
    statusCallback: "{{#voiceStatusCallbackUrl}}{{voiceStatusCallbackUrl}}{{/voiceStatusCallbackUrl}}",
    statusCallbackMethod: "{{#postHttpMethod}}{{postHttpMethod}}{{/postHttpMethod}}",
    statusCallbackEvent: ["{{#initiatedCallEvent}}{{initiatedCallEvent}}{{/initiatedCallEvent}}", "{{#ringingCallEvent}}{{ringingCallEvent}}{{/ringingCallEvent}}", "{{#answeredCallEvent}}{{answeredCallEvent}}{{/answeredCallEvent}}", "{{#completedCallEvent}}{{completedCallEvent}}{{/completedCallEvent}}"],
    method: "{{#getHttpMethod}}{{getHttpMethod}}{{/getHttpMethod}}"
}, function(err, call) {
    process.stdout.write(call.sid);
});
