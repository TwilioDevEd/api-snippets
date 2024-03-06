// Download the Node helper library from twilio.com/docs/node/install
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const twiml = new VoiceResponse();

twiml.say('You will now be connected to the first caller in the queue.');
const dial = twiml.dial();
dial.queue('Queue Demo');
twiml.redirect();

console.log(twiml.toString());
