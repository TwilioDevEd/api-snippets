const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.conversation({
    serviceInstanceSid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    statusCallback: 'https://example.com/yourStatusCallback',
    statusCallbackEvent: 'call-initiated call-ringing call-answered call-completed'
});

console.log(response.toString());
