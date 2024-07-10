const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
start.transcription({statusCallbackUrl: 'https://example.com/your-callback-url', hints: '$OOV_CLASS_ALPHANUMERIC_SEQUENCE'});

console.log(response.toString());
