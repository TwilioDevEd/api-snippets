const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.dial('415-123-4567');
response.say('Goodbye');

console.log(response.toString());
