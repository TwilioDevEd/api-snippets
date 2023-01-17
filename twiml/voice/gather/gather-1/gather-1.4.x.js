const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const gather = response.gather({
    input: 'speech dtmf',
    timeout: 3,
    numDigits: 1
});
gather.say('Please press 1 or say sales for sales.');

console.log(response.toString());
