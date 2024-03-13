const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.number({
    statusCallbackEvent: 'initiated ringing answered completed',
    statusCallback: 'https://myapp.com/calls/events',
    statusCallbackMethod: 'POST'
}, '+14155555555');
dial.number({
    statusCallbackEvent: 'initiated ringing answered completed',
    statusCallback: 'https://example.com/events',
    statusCallbackMethod: 'POST'
}, '+14153333333');

console.log(response.toString());
