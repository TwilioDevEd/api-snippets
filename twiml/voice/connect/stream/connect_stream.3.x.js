const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.stream({ url: 'wss://example.com/audiostream' });
response.say(
  'This TwiML instruction is unreachable unless the Stream is ended by your WebSocket server.'
);

console.log(response.toString());
