const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.sms({
    from: '+14105551234',
    to: '+14105556789'
}, 'The king stay the king.');

console.log(response.toString());
