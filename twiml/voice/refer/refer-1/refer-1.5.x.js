const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const refer = response.refer();
refer.sip('sip:alice@example.com');

console.log(response.toString());
