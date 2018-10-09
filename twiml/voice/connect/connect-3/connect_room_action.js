const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect({
    action: 'https://myactionurl.com/'
});
connect.room({
    statusCallback: 'https://myactionurl.com/'
}, 'meeting');

console.log(response.toString());
