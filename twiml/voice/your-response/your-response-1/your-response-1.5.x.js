const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.say('Hello World');
response.play('https://api.twilio.com/Cowbell.mp3');

console.log(response.toString());
