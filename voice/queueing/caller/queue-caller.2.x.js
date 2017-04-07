// Download the Node helper library from twilio.com/docs/node/install
var twilio = require('twilio');
var twiml = new twilio.TwimlResponse();

twiml.enqueue('Queue Demo');

console.log(twiml.toString());