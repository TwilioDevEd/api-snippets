const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.dial({
    action: '/handleDialCallStatus',
    method: 'GET'
}, '415-123-4567');
response.say('I am unreachable');

console.log(response.toString());
