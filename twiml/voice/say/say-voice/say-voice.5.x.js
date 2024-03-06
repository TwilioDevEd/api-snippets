const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say({
    voice: 'Polly.Mathieu',
    language: 'fr-FR'
}, 'Bonjour! Je m\'appelle Mathieu.');

console.log(response.toString());
