const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.play('https://api.twilio.com/cowbell.mp3');

console.log(response.toString());
