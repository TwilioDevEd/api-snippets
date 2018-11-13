const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.reject();

console.log(response.toString());
