// Download the Node helper library from twilio.com/docs/node/install
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const twiml = new VoiceResponse();

twiml.enqueue('Queue Demo');

console.log(twiml.toString());
