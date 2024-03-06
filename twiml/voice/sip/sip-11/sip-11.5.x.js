const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
dial.number('+12143211432');
dial.sip('sip:alice-soft-phone@example.com');
dial.sip('sip:alice-desk-phone@example.com');
dial.sip('sip:alice-mobile-client@example.com');

console.log(response.toString());
