const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.record();

console.log(response.toString());
