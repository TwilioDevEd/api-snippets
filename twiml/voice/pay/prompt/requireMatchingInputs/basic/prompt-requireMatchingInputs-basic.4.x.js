const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const pay = response.pay({
    paymentMethod: 'ach-debit',
    chargeAmount: '13.22'
});
const prompt = pay.prompt({
    for: 'bank-account-number'
});
prompt.say('Thanks for using our service. Please enter your bank account number.');
const prompt2 = pay.prompt({
    for: 'bank-account-number',
    requireMatchingInputs: true
});
prompt2.say('Thank you. Please enter your bank account number again.');

console.log(response.toString());
