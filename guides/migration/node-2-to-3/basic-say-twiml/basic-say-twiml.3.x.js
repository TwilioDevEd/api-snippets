const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say(
  {
    voice: 'woman',
    language: 'es',
  },
  'Hola Mundo!'
);

console.log(response.toString());
