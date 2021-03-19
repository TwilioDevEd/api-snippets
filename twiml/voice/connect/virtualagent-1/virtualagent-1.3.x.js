const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect({
    action: 'https://myactionurl.com/twiml'
});
connect.virtualAgent({
    connectorName: 'project',
    statusCallback: 'https://mycallbackurl.com'
});

console.log(response.toString());
