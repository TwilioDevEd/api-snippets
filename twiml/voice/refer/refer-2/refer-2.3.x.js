const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const refer = response.refer();
refer.sip('sip:alice@example.com?X-AcctNumber=123456&X-ReasonForCalling=billing-question');

console.log(response.toString());
