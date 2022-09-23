const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
const virtualagent = connect.virtualAgent({connectorName: 'uniqueName'});
virtualagent.config({name: 'language', value: 'en-us'});
virtualagent.config({name: 'voiceName', value: 'en-US-Wavenet-C'});

console.log(response.toString());
