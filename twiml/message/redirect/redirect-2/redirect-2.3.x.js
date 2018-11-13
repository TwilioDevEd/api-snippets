const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.redirect('../nextInstructions');

console.log(response.toString());
