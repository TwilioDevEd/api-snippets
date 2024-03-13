const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial({
    sequential: true
});
dial.sip('sip:alice@example.com');
dial.sip('sip:bob@example.com');
dial.sip('sip:charlie@example.com');

console.log(response.toString());
