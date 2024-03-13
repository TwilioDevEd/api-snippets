const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say('We\'re sorry. All of our agents are busy right now.');
response.say('We will call you back as soon as possible.');
response.say('Please stay on the line to be redirected to the main menu.');
const hangup = response.hangup();
hangup.parameter({
    name: 'payment_collected',
    value: false
});

console.log(response.toString());
