const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.say('Hello');

console.log(response.toString());
