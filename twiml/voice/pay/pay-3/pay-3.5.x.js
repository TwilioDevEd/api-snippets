const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
response.say('Calling Twilio Pay');
response.pay({
    chargeAmount: '20.45',
    action: 'https://enter-your-callback-function-url.twil.io/pay'
});

console.log(response.toString());
