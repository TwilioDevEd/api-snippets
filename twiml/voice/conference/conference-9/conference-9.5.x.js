const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial({
    action: 'handleLeaveConference.php',
    method: 'POST',
    hangupOnStar: true,
    timeLimit: 30
});
dial.conference('LoveTwilio');

console.log(response.toString());
