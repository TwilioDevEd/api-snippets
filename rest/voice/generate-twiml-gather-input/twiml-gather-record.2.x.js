var express = require('express');
var router = express.Router();
var twilio = require('twilio');

// POST: '/voice/handle-gather'
router.post('/handle-gather', twilio.webhook({validate: false}), function (request, response) {
    var selectedOption = request.body.Digits;
    var twiml = new twilio.TwimlResponse();

    if (selectedOption == '1') {
      // Dial a new person
      twiml.dial('+13105551212');
      twiml.say('The call failed or the remote party hung up. Goodbye.');
      response.send(twiml);

    } else if (selectedOption == '2') {
      // Record your message
      twiml.say('Record your message after the tone.');
      twiml.record({
        action: '/voice/handle-record',
        maxLength: '30'
      });
      response.send(twiml);
    }
    response.send(redirectWelcome());
});

var redirectWelcome = function () {
    var twiml = new twilio.TwimlResponse();
    twiml.say("Returning to the main menu", {voice: "alice", language: "en-GB"});
    twiml.redirect("/voice");
    return twiml;
};

module.exports = router;