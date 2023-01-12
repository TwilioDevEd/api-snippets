const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const pay = response.pay();
const prompt = pay.prompt({
    for: 'security-code',
    cardType: 'amex'
});
prompt.say('Please enter security code for your American Express card. It’s the 4 digits located on the front of your card');

console.log(response.toString());
