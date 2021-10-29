const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.room({
    participantIdentity: 'alice'
}, 'DailyStandup');

console.log(response.toString());
