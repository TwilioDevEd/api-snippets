const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.enqueue({
    waitUrl: 'wait.xml'
}, 'support');
response.say('Unfortunately, the support line has closed. Please call again tomorrow.');

console.log(response.toString());
