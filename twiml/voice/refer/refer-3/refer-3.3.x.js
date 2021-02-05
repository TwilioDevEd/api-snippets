const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const refer = response.refer();
refer.sip('sip:alice@example.com?User-to-User=123456789%3Bencoding%3Dhex');

console.log(response.toString());
