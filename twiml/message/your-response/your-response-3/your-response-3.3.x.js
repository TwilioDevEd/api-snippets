const MessagingResponse = require('twilio').twiml.MessagingResponse;


const response = new MessagingResponse();
response.message('I\'m hungry!');

console.log(response.toString());
