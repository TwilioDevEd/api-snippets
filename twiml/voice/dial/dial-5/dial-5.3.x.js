const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial({
    record: 'record-from-ringing-dual',
    recordingStatusCallback: 'www.myexample.com'
});
dial.number('+15558675309');

console.log(response.toString());
