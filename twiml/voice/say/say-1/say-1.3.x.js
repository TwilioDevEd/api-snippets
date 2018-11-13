const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.say({
    voice: 'woman',
    language: 'fr-FR'
}, 'Chapeau!');

console.log(response.toString());
