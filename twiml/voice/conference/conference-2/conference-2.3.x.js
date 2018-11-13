const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.conference({
    startConferenceOnEnter: false
}, 'moderated-conference-room');

console.log(response.toString());
