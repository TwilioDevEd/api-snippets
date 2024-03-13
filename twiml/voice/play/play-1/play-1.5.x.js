const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.play({
    loop: 10
}, 'https://api.twilio.com/cowbell.mp3');

console.log(response.toString());
