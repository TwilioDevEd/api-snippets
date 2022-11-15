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
const prompt3 = pay.prompt({
    for: 'bank-account-number',
    errorType: 'input-matching-failed'
});
prompt3.say('Sorry, your two bank account number inputs did not match. Please enter your bank account number again. We will then ask a second time again.');

console.log(response.toString());
