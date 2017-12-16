const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
dial.sip('sip:kate@example.com?mycustomheader=foo&myotherheader=bar');

console.log(response.toString());
