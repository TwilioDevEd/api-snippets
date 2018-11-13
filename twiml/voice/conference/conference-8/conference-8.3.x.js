const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.conference({
    beep: false,
    endConferenceOnExit: true
}, 'Customer Waiting Room');

console.log(response.toString());
