const twilio = require('twilio');

const twiml = new twilio.TwimlResponse();
twiml.message('', function() {
  this.body('Hello friend');
  this.media('https://demo.twilio.com/owl.png');
});

console.log(twiml.toString());
