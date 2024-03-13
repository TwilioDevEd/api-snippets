const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const dial = response.dial();
const application = dial.application();
application.applicationSid('AP1234567890abcdef1234567890abcd');
application.parameter({
    name: 'AccountNumber',
    value: '12345'
});
application.parameter({
    name: 'TicketNumber',
    value: '9876'
});

console.log(response.toString());
