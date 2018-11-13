const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.number({
    sendDigits: 'wwww1928'
}, '415-123-4567');

console.log(response.toString());
