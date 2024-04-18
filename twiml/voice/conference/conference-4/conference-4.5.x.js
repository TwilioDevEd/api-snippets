const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.conference({
    statusCallback: 'https://myapp.com/events',
    statusCallbackEvent: 'start end join leave mute hold'
}, 'EventedConf');

console.log(response.toString());
