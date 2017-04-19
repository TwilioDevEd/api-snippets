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
    {{#applicationSid}}applicationSid: "{{applicationSid}}",{{/applicationSid}}
    {{#sendDigitsVoice}}sendDigits: "{{sendDigitsVoice}}",{{/sendDigitsVoice}}
    {{#callMethod}}method: "{{callMethod}}",{{/callMethod}}
    {{#callStatusCallback}}statusCallback: "{{callStatusCallback}}",{{/callStatusCallback}}
    {{#callStatusCallbackMethod}}statusCallbackMethod: "{{callStatusCallbackMethod}}",{{/callStatusCallbackMethod}}
    {{#callFallbackUrl}}fallbackUrl: "{{callFallbackUrl}}",{{/callFallbackUrl}}
    {{#callFallbackMethod}}fallbackMethod: "{{callFallbackMethod}}",{{/callFallbackMethod}}
    {{#callIfMachine}}ifMachine: "{{callIfMachine}}",{{/callIfMachine}}
    {{#callTimeout}}timeout: "{{callTimeout}}",{{/callTimeout}}
    {{#callRecord}}record: "{{callRecord}}",{{/callRecord}}
    {{#callRecordingChannels}}recordingChannels: "{{callRecordingChannels}}",{{/callRecordingChannels}}
    {{#callRecordingStatusCallback}}recordingStatusCallback: "{{callRecordingStatusCallback}}",{{/callRecordingStatusCallback}}
    {{#callRecordingStatusCallbackMethod}}recordingStatusCallbackMethod: "{{callRecordingStatusCallbackMethod}}",{{/callRecordingStatusCallbackMethod}}
    {{#callSipAuthUsername}}sipAuthUsername: "{{callSipAuthUsername}}",{{/callSipAuthUsername}}
    {{#callSipAuthPassword}}sipAuthPassword: "{{callSipAuthPassword}}",{{/callSipAuthPassword}}
    {{#callStatusCallbackEvent}}
    statusCallbackEvent: [
    {{#callStatusCallbackEvents}}
        "{{.}}",
    {{/callStatusCallbackEvents}}
    ],
    {{/callStatusCallbackEvent}}
}, function(err, call) {
    process.stdout.write(call.sid);
});
