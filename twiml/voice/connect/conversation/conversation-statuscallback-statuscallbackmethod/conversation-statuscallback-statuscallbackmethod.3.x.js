const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.conversation({
    serviceInstanceSid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    statusCallback: 'https://example.com/yourStatusCallback',
    statusCallbackMethod: 'GET'
});

console.log(response.toString());
