const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say('Hello! You will be now be connected to a virtual agent.');
const connect = response.connect({
    action: 'https://myactionurl.com/virtualagent_ended'
});
connect.virtualAgent({
    connectorName: 'project',
    statusCallback: 'https://mycallbackurl.com'
});

console.log(response.toString());
