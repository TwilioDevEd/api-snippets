// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{accountSid}}';
var authToken = '{{authToken}}';
var client = require('twilio')(accountSid, authToken);

client.calls.create({
    {{#fromPhoneNumber}}from: "{{fromPhoneNumber}}",{{/fromPhoneNumber}}
    {{#toPhoneNumber}}to: "{{toPhoneNumber}}",{{/toPhoneNumber}}
    {{#toVoiceClient}}to: "{{toVoiceClient}}",{{/toVoiceClient}}
    {{#callUrl}}url: "{{callUrl}}",{{/callUrl}}
    {{#sendDigitsVoice}}sendDigits: "{{sendDigitsVoice}}",{{/sendDigitsVoice}}
    {{#callMethod}}method: "{{callMethod}}",{{/callMethod}}
    {{#callStatusCallback}}statusCallback: "{{callStatusCallback}}",{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}statusCallbackMethod: "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
    {{#callStatusCallbackEvent}}
    statusCallbackEvent: [
    {{#callStatusCallbackEvents}}
        "{{.}}",
    {{/callStatusCallbackEvents}}
    ],
    {{/callStatusCallbackEvent}}
}, function(err, call) {
    console.log(call.sid);
});
