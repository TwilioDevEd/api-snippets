const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
start.siprec({
    name: 'My SIPREC Stream',
    connectorName: 'Gridspace_1'
});

console.log(response.toString());
