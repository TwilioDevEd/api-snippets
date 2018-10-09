const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect({
    action: 'https://myactionurl.com/',
    timeout: '5'
});
connect.room({
    statusCallback: 'https://myactionurl.com/',
    mediaRegion: 'ie1'
}, 'meeting');

console.log(response.toString());
