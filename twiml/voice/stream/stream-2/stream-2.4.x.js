const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
const stream = start.stream({
    url: 'wss://mystream.ngrok.io/example'
});
stream.parameter({
    name: 'FirstName',
    value: 'Jane'
});
stream.parameter({
    name: 'LastName',
    value: 'Doe'
});

console.log(response.toString());
