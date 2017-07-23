const express = require('express');
const router = express.Router();
const twilio = require('twilio');

// POST: '/handle-record'
router.post(
  '/handle-record',
  twilio.webhook({ validate: false }),
  (request, response) => {
    const twiml = new twilio.TwimlResponse();
    twiml.say('Listen to your recorded message.');
    twiml.play(request.body.RecordingUrl);
    twiml.say('Goodbye.');
    response.send(twiml);
  }
);

module.exports = router;
