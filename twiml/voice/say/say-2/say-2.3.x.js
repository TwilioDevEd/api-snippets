const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say(
  {
    voice: 'alice',
    language: 'fr-FR',
  },
  'Chapeau!'
);

console.log(response.toString());
