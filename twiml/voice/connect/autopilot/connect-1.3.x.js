const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.autopilot('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

console.log(response.toString());
