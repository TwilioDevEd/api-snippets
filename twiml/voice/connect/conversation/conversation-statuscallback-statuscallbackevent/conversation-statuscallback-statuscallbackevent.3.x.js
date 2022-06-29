const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.conversation({
    serviceInstanceSid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    statusCallback: 'https://your-status-callback-url.com/statusCallback',
    statusCallbackEvent: 'call-initiated call-in-progress call-ringing call-completed'
});

console.log(response.toString());
