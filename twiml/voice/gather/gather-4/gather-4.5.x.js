const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const gather = response.gather({
    input: 'speech',
    action: '/completed'
});
gather.say('Welcome to Twilio, please tell us why you\'re calling');

console.log(response.toString());
