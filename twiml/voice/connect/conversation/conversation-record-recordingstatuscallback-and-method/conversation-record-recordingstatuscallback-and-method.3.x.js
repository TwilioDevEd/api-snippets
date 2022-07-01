const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.conversation({
    serviceInstanceSid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    record: 'record-from-answer',
    recordingStatusCallback: 'https://example.com/yourRecordingStatusCallback',
    recordingStatusCallbackMethod: 'GET'
});

console.log(response.toString());
