const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const pay = response.pay();
const prompt = pay.prompt({
    for: 'payment-card-number'
});
prompt.say('Please enter your 15 digit visa or master card number.');

console.log(response.toString());
