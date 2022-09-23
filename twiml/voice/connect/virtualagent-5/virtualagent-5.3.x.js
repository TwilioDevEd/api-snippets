const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
const virtualagent = connect.virtualAgent({connectorName: 'uniqueName'});
virtualagent.parameter({name: 'customer_name', value: 'Burton Guster'});

console.log(response.toString());
