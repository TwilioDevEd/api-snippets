const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.play({
    digits: 'wwww3'
});

console.log(response.toString());
