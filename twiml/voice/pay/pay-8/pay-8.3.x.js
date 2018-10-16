const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const pay = response.pay();
const prompt = pay.prompt({
    for: 'security-code',
    cardType: 'visa'
});
prompt.say('Please enter security code for your visa card. It’s the 3 digits located in the back of your card');

console.log(response.toString());
