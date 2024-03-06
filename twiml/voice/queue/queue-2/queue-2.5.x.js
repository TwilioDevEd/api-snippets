const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.say('You will now be connected to an agent.');

console.log(response.toString());
