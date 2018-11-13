const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.queue({
    url: 'about_to_connect.xml'
}, 'support');

console.log(response.toString());
