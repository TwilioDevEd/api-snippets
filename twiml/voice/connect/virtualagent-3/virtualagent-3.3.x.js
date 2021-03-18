const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.virtualAgent({
    connectorName: 'project',
    language: 'fr'
});

console.log(response.toString());
