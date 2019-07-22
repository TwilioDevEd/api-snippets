const VoiceResponse = require('twilio').twiml.VoiceResponse;


const response = new VoiceResponse();
const dial = response.dial({
    record: 'record-from-answer',
    timeout: 10,
    hangupOnStar: true,
    callerId: 'bob',
    method: 'POST',
    action: '/handle_post_dial'
});
dial.sip({
    method: 'POST',
    url: '/handle_screening_on_answer'
}, 'sip:kate@example.com?x-customheader=foo');

console.log(response.toString());
