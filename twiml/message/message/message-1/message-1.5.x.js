const MessagingResponse = require('twilio').twiml.MessagingResponse;


const response = new MessagingResponse();
response.message('Store Location: 123 Easy St.');

console.log(response.toString());
