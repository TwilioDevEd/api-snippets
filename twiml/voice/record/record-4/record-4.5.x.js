const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.record({
    transcribe: true,
    transcribeCallback: '/handle_transcribe.php'
});

console.log(response.toString());
