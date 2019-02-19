const http = require('http');
const express = require('express');
const router = express.Router();
const app = express();
const bodyParser = require('body-parser');
const twilio = require('twilio');
const VoiceResponse = require('twilio').twiml.VoiceResponse;

app.use(bodyParser.json());

// POST: '/voice'
router.post('/voice', twilio.webhook({ validate: false }), (req, res) => {
  const twiml = new VoiceResponse();

  const gather = twiml.gather({
    action: 'voice/handle-record',
    numDigits: '1',
    method: 'POST',
  });
  gather.play({}, 'http://howtodocs.s3.amazonaws.com/et-phone.mp3', {
    loop: 3,
  });

  res.send(twiml);
});

// POST: '/voice/handle-gather'
router.post(
  '/handle-gather',
  twilio.webhook({ validate: false }),
  (req, res) => {
    const selectedOption = req.body.Digits;
    const twiml = new VoiceResponse();

    if (selectedOption == '1') {
      // Dial a new person
      twiml.dial('+13105551212');
      twiml.say('The call failed or the remote party hung up. Goodbye.');

      res.send(twiml);
    } else if (selectedOption == '2') {
      // Record your message
      twiml.say('Record your message after the tone.');

      twiml.record({
        action: '/voice/handle-record',
        maxLength: '30',
      });

      res.send(twiml);
    }

    res.send(redirectWelcome());
  }
);

// POST: '/handle-record'
router.post(
  '/handle-record',
  twilio.webhook({ validate: false }),
  (req, res) => {
    const twiml = new VoiceResponse();

    twiml.say('Listen to your recorded message.');
    twiml.play({}, req.body.RecordingUrl);
    twiml.say('Goodbye.');

    res.send(twiml);
  }
);

const redirectWelcome = () => {
  const twiml = new VoiceResponse();

  twiml.say(
    { voice: 'alice', language: 'en-GB' },
    'Returning to the main menu'
  );
  twiml.redirect('/voice');

  return twiml;
};

app.use('/', router);

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
