// Download the Node helper library from twilio.com/docs/node/install
let twilio = require('twilio');
let twiml = new twilio.TwimlResponse();

twiml.enqueue('Queue Demo');

console.log(twiml.toString());
