const VoiceResponse = require('twilio').twiml.VoiceResponse;
const response = new VoiceResponse();
const gather = response.gather({timeout: 10, finishOnKey: '*'});
gather.say('Please enter your pin number and then press star.');


console.log(response.toString());