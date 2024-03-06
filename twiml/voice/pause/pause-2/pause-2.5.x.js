const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.pause({
    length: 5
});
response.say('Hi there.');

console.log(response.toString());
