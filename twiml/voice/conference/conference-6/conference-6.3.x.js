const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
dial.conference({beep: 'false', waitUrl: '', startConferenceOnEnter: 'true', endConferenceOnExit: 'true'}, 'NoMusicNoBeepRoom');

console.log(response.toString());
