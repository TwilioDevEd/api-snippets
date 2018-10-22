const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const pay = response.pay();
const prompt = pay.prompt({
    for: 'expiration-date',
    attempt: '1'
});
prompt.say('Please enter your expiration date, two digits for the month and two digits for the year.');
const prompt2 = pay.prompt({
    for: 'expiration-date',
    attempt: '2 3'
});
prompt2.say('Please enter your expiration date, two digits for the month and two digits for the year. For example, if your expiration date is March 2022, then please enter 0 3 2 2');

console.log(response.toString());
