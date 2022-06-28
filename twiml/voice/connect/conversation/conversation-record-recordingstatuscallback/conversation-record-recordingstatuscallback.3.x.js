const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.conversation({
    serviceInstanceSid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    record: 'record-from-answer',
    recordingStatusCallback: 'https://your-recording-status-callback-url.com/'
});

console.log(response.toString());
