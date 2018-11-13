const MessagingResponse = require('twilio').twiml.MessagingResponse;


const response = new MessagingResponse();
response.message('This is message 1 of 2.');
response.message('This is message 2 of 2.');

console.log(response.toString());
