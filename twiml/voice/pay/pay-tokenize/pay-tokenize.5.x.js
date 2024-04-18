const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.pay({tokenType: 'one-time', chargeAmount: '0'});

console.log(response.toString());