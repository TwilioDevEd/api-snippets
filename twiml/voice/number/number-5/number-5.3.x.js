const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
dial.number({
    url: 'http://example.com/agent_screen_call'
}, '415-123-4567');

console.log(response.toString());
