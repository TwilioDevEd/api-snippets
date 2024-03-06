const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.dial('415-123-4567');
response.redirect('http://www.foo.com/nextInstructions');

console.log(response.toString());
