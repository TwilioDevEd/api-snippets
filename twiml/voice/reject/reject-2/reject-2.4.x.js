const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.reject({
    reason: 'busy'
});

console.log(response.toString());
