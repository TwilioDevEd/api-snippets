const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const hangup = response.hangup();
hangup.parameter({
    name: 'hangup_reason',
    value: 'no agents available'
});

console.log(response.toString());
