const express = require('express');
const router = express.Router();
const twilio = require('twilio');

// POST: '/voice'
router.post(
  '/voice',
  twilio.webhook({ validate: false }),
  (request, response) => {
    const twiml = new twilio.TwimlResponse();
    twiml.gather(
      {
        action: 'voice/handle-record',
        numDigits: '1',
        method: 'POST',
      },
      node => {
        node.play('http://howtodocs.s3.amazonaws.com/et-phone.mp3', {
          loop: 3,
        });
      }
    );
    response.send(twiml);
  }
);

module.exports = router;
