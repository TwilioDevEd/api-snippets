const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.sip('sip:jack@example.com;transport=tcp');

console.log(response.toString());
