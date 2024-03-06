const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.record({
    timeout: 10,
    transcribe: true
});

console.log(response.toString());
