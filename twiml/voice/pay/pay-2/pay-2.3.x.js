const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say('Calling Twilio Pay');
response.addText('')
response.pay({chargeAmount: '20.45'});

console.log(response.toString());