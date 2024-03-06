const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.pay();

console.log(response.toString());
