const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial({
    record: 'record-from-answer',
    recordingTrack: 'inbound',
    recordingStatusCallback: 'https://www.myexample.com/recording-handler'
});
dial.number('+15551239876');

console.log(response.toString());
