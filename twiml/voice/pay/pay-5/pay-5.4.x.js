const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const pay = response.pay();
const prompt = pay.prompt({
    for: 'payment-card-number'
});
prompt.play('https://myurl.com/twilio/twiml/audio/card_number.mp3');

console.log(response.toString());
