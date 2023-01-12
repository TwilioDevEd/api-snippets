const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.number('858-987-6543');
dial.number('415-123-4567');
dial.number('619-765-4321');

console.log(response.toString());
