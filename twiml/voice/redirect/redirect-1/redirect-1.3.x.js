const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.redirect({
    method: 'POST'
}, 'http://pigeons.com/twiml.xml');

console.log(response.toString());
