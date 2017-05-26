const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say({language: 'sv-SE'}, 'Hej!');

console.log(response.toString());
