const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial({
  callerId: '+1888XXXXXXX',
});
dial.number('858-987-6543');
dial.client('jenny');
dial.client('tommy');

console.log(response.toString());
