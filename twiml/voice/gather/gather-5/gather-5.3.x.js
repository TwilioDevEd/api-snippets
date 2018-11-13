const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const gather = response.gather({
    action: '/process_gather.php',
    method: 'GET'
});
gather.say('Enter something, or not');
response.redirect({
    method: 'GET'
}, '/process_gather.php?Digits=TIMEOUT');

console.log(response.toString());
