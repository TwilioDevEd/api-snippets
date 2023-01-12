const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.play('http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3');

console.log(response.toString());
