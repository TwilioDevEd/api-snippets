const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
dial.sim('DE8caa2afb9d5279926619c458dc7098a8');

console.log(response.toString());
