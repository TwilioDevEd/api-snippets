const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.enqueue({
    waitUrl: 'wait-music.xml'
}, 'support');

console.log(response.toString());
