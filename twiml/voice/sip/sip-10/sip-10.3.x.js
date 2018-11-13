const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.sip({
    statusCallbackEvent: 'initiated ringing answered completed',
    statusCallback: 'https://myapp.com/calls/events',
    statusCallbackMethod: 'POST'
}, 'sip:kate@example.com');

console.log(response.toString());
