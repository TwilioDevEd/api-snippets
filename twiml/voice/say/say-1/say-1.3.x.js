const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say(
  {
    voice: 'woman',
    language: 'fr',
  },
  'Chapeau!'
);

console.log(response.toString());
