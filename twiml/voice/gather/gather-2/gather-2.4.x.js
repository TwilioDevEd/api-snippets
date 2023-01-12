const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.gather();

console.log(response.toString());
