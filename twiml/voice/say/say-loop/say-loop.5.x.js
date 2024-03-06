const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say({
    loop: 2
}, 'Hello!');

console.log(response.toString());
