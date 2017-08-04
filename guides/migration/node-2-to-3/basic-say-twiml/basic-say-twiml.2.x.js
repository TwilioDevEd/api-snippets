const twilio = require('twilio');

const twiml = new twilio.TwimlResponse();
twiml.say('Hola Mundo!', { voice: 'woman', language: 'es' });

console.log(twiml.toString());
