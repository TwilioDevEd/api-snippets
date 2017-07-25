const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
response.say('Our store is located at 123 Easy St.');
response.sms(
  {
    action: '/smsHandler.php',
    method: 'POST',
  },
  'Store Location: 123 Easy St.'
);

console.log(response.toString());
