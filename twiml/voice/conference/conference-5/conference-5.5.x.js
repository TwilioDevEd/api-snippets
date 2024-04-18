const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.conference({
    muted: true
}, 'SimpleRoom');

console.log(response.toString());
