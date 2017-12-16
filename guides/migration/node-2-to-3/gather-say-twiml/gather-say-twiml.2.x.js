const twilio = require('twilio');

const twiml = new twilio.TwimlResponse();
twiml.gather(
  {
    input: 'speech',
    action: '/completed',
  },
  function() {
    this.say("Welcome to Twilio, please tell us why you're calling");
  }
);

console.log(twiml.toString());
