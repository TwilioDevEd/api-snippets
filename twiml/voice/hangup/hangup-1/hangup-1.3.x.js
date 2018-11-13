const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.hangup();

console.log(response.toString());
