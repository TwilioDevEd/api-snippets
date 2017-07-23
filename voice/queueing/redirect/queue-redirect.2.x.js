// Download the Node helper library from twilio.com/docs/node/install
let twilio = require('twilio');
let twiml = new twilio.TwimlResponse();

twiml
  .say('You will now be connected to the first caller in the queue.')
  .dial({}, function() {
    this.queue('Queue Demo');
  })
  .redirect();

console.log(twiml.toString());
