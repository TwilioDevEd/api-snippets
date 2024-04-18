const MessagingResponse = require('twilio').twiml.MessagingResponse;


const response = new MessagingResponse();
const message = response.message();
message.body('Hello friend');
message.media('https://demo.twilio.com/owl.png');

console.log(response.toString());
