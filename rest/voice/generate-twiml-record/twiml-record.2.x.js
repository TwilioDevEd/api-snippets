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

// POST: '/voice/handle-gather'
router.post(
  '/handle-gather',
  twilio.webhook({ validate: false }),
  (request, response) => {
    const selectedOption = request.body.Digits;
    const twiml = new twilio.TwimlResponse();

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
        maxLength: '30',
      });
      response.send(twiml);
    }
    response.send(redirectWelcome());
  }
);

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

function redirectWelcome() {
  const twiml = new twilio.TwimlResponse();
  twiml.say('Returning to the main menu', {
    voice: 'alice',
    language: 'en-GB',
  });
  twiml.redirect('/voice');
  return twiml;
}

module.exports = router;
