const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
const application = dial.application();
application.applicationSid('AP1234567890abcdef1234567890abcd');

console.log(response.toString());
