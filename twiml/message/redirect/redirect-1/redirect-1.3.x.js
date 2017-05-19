const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.redirect('http://www.foo.com/nextInstructions');

console.log(response.toString());
