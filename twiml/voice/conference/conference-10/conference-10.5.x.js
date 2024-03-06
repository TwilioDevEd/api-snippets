const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial();
dial.conference({
    record: 'record-from-start',
    recordingStatusCallback: 'www.myexample.com'
}, 'LoveTwilio');

console.log(response.toString());
