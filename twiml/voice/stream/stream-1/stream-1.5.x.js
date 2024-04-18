const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
start.stream({
  name: 'Example Audio Stream',
  url: 'wss://example.com/audiostream',
});
response.say('The stream has started.');

console.log(response.toString());
