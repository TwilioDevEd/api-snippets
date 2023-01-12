const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial({
    record: 'record-from-ringing-dual',
    recordingStatusCallback: 'www.myexample.com'
});
dial.conference('myteamroom');

console.log(response.toString());
