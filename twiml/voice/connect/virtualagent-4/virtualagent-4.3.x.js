const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.virtualAgent({
    connectorName: 'project',
    sentimentAnalysis: true
});

console.log(response.toString());
