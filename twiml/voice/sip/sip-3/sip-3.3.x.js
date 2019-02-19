const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.sip('sip:jack@example.com?x-mycustomheader=foo&x-myotherheader=bar');

console.log(response.toString());
