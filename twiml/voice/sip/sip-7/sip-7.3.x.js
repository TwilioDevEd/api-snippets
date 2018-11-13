const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.sip({
    username: 'admin',
    password: '1234'
}, 'kate@example.com');

console.log(response.toString());
