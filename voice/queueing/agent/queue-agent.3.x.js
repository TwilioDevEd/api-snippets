// Download the Node helper library from twilio.com/docs/node/install
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const twiml = new VoiceResponse();

const dial = twiml.dial();
dial.queue('Queue Demo');

console.log(twiml.toString());
