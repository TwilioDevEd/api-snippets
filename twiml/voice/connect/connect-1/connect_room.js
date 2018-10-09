const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const connect = response.connect();
connect.room('DailyStandup');

console.log(response.toString());
