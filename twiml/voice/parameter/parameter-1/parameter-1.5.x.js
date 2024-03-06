const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
const client = dial.client();
client.identity('user_jane');
client.parameter({
    name: 'FirstName',
    value: 'Jane'
});
client.parameter({
    name: 'LastName',
    value: 'Doe'
});

console.log(response.toString());
