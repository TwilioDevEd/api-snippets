const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect({
    action: 'https://your-action-url.com/'
});
connect.conversation({
    serviceInstanceSid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    statusCallback: 'https://your-status-callback-url.com/statusCallback'
});

console.log(response.toString());
