// Download the Node helper library from twilio.com/docs/node/install
const twilio = require('twilio');
const twiml = new twilio.TwimlResponse();

twiml.enqueue('Queue Demo');

console.log(twiml.toString());
