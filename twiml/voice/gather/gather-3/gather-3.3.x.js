const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const gather = response.gather({
    action: '/process_gather.php',
    method: 'GET'
});
gather.say('Please enter your account number,\nfollowed by the pound sign');
response.say('We didn\'t receive any input. Goodbye!');

console.log(response.toString());
