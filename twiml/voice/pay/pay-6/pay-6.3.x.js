const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const pay = response.pay();
const prompt = pay.prompt({
    for: 'payment-card-number'
});
prompt.say('Please enter your 16 digit Visa or Mastercard number.');

console.log(response.toString());
