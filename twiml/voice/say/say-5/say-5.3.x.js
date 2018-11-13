const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.say({
    voice: 'alice',
    language: 'pt-BR',
    loop: 2
}, 'Bom dia.');

console.log(response.toString());
