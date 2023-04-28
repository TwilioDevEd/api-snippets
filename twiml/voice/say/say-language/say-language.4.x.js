const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say({
    language: 'fr-FR'
}, 'Bonjour!');

console.log(response.toString());
