const MessagingResponse = require('twilio').twiml.MessagingResponse;

const response = new MessagingResponse();
response.message('Hello World!');
response.redirect('https://demo.twilio.com/sms/welcome');

console.log(response.toString());
