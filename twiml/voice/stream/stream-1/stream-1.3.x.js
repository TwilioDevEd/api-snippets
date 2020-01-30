const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
start.stream({
    name: 'Example Audio Stream',
    url: 'wss://mystream.ngrok.io/audiostream'
});

console.log(response.toString());
