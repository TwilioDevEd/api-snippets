const twilio = require('twilio');

const twiml = new twilio.TwimlResponse();
twiml.message('', function() {
  this.body('Store Location: 123 Easy St.');
});

console.log(twiml.toString());
