const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const gather = response.gather({input: 'speech dtmf', numDigits: 1, timeout: 3});
gather.say('Please press 1 or say sales for sales.');

console.log(response.toString());
