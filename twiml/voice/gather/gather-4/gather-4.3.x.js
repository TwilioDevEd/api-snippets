const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const gather = response.gather({action: '/completed', input: 'speech'});
gather.say('Welcome to Twilio, please tell us why you\'re calling');

console.log(response.toString());
