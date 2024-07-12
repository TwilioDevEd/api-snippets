const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const stop = response.stop();
stop.transcription({name: 'Contact center transcription'});

console.log(response.toString());
