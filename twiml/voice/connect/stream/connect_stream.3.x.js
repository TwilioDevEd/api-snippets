const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.stream({
    url: 'wss://mystream.ngrok.io/audiostream'
});

console.log(response.toString());
