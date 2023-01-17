const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const pay = response.pay({
    paymentMethod: 'credit-card',
    validCardTypes: 'visa mastercard amex'
});
const prompt = pay.prompt({
    for: 'payment-card-number'
});
prompt.say('Please enter your credit card number.');
const prompt2 = pay.prompt({
    for: 'payment-card-number',
    errorType: 'timeout'
});
prompt2.say('You didn\'t enter your credit card number. Please enter your credit card number.');
const prompt3 = pay.prompt({
    for: 'payment-card-number',
    errorType: 'invalid-card-number'
});
prompt3.say('You entered an invalid credit card number. Please try again.');
const prompt4 = pay.prompt({
    for: 'payment-card-number',
    errorType: 'invalid-card-type'
});
prompt4.say('The card number you entered isn\'t from one of our accepted credit card issuers. Please enter a Visa, MasterCard, or American Express credit card number.');
const prompt5 = pay.prompt({
    for: 'expiration-date'
});
prompt5.say('Please enter your credit card\'s expiration date. Two digits for the month and two digits for the year.');
const prompt6 = pay.prompt({
    for: 'expiration-date',
    errorType: 'timeout'
});
prompt6.say('Sorry. You didn\'t enter an expiration date. Please enter your card\'s expiration date. Two digits for the month and two digits for the year.');
const prompt7 = pay.prompt({
    for: 'expiration-date',
    errorType: 'invalid-date'
});
prompt7.say('The date you entered was incorrect or is in the past. Please enter the expiration date. Two digits for the month and two digits for the year. For example, to enter July twenty twenty two, enter 0 7 2 2.');
const prompt8 = pay.prompt({
    for: 'security-code',
    cardType: 'visa mastercard'
});
prompt8.say('Please enter your security code. It\'s the 3 digits located on the back of your card.');
const prompt9 = pay.prompt({
    for: 'security-code',
    errorType: 'timeout',
    cardType: 'visa mastercard'
});
prompt9.say('You didn\'t enter your credit card security code. Please enter your security code. It\'s the 3 digits located on the back of your card.');
const prompt10 = pay.prompt({
    for: 'security-code',
    errorType: 'invalid-security-code',
    cardType: 'visa mastercard'
});
prompt10.say('That was an invalid security code. The security code must be 3 digits. Please try again.');
const prompt11 = pay.prompt({
    for: 'security-code',
    cardType: 'amex'
});
prompt11.say('Please enter your security code. It\'s the 4 digits located on the front of your card.');
const prompt12 = pay.prompt({
    for: 'security-code',
    errorType: 'timeout',
    cardType: 'amex'
});
prompt12.say('You didn\'t enter your credit card security code.  Please enter your security code. It\'s the 4 digits located on the front of your card.');
const prompt13 = pay.prompt({
    for: 'security-code',
    errorType: 'invalid-security-code',
    cardType: 'amex'
});
prompt13.say('That was an invalid security code. The security code must be 4 digits. Please try again.');
const prompt14 = pay.prompt({
    for: 'postal-code'
});
prompt14.say('Please enter your 5 digit billing zip code.');
const prompt15 = pay.prompt({
    for: 'postal-code',
    errorType: 'timeout'
});
prompt15.say('You didn\'t enter your billing zip code. Please enter your 5 digit billing zip code.');
const prompt16 = pay.prompt({
    for: 'payment-processing'
});
prompt16.say('Thank you. Please wait while we process your payment.');

console.log(response.toString());
