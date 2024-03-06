const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const reject = response.reject();
reject.parameter({
    name: 'reject_reason',
    value: 'no agents available'
});

console.log(response.toString());
