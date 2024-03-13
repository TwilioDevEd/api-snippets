const MessagingResponse = require('twilio').twiml.MessagingResponse;

const response = new MessagingResponse();
response.redirect('http://www.example.com/nextInstructions');

console.log(response.toString());
