var express = require('express');
var router = express.Router();
var twilio = require('twilio');

// POST: '/handle-record'
router.post('/handle-record', twilio.webhook({ validate: false }), function(
  request,
  response
) {
  var twiml = new twilio.TwimlResponse();
  twiml.say('Listen to your recorded message.');
  twiml.play(request.body.RecordingUrl);
  twiml.say('Goodbye.');
  response.send(twiml);
});

module.exports = router;
