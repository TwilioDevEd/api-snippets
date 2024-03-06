const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.leave();

console.log(response.toString());
