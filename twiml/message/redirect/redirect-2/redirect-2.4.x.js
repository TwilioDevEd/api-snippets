const MessagingResponse = require('twilio').twiml.MessagingResponse;

const response = new MessagingResponse();
response.redirect('../nextInstructions');

console.log(response.toString());
