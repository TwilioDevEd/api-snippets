const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial({
    callerId: '+15551112222'
});
dial.number('+15558675310');

console.log(response.toString());
