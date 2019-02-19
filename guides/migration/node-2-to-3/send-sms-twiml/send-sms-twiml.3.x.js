const MessagingResponse = require('twilio').twiml.MessagingResponse;

const response = new MessagingResponse();
const message = response.message();
message.body('Store Location: 123 Easy St.');

console.log(response.toString());
