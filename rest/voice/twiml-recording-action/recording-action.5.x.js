const http = require('http');
const express = require('express');
const router = express.Router();
const app = express();
const twilio = require('twilio');
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const bodyParser = require('body-parser');

app.use(bodyParser.json());

// POST: '/handle-record'
router.post(
  '/handle-record',
  twilio.webhook({ validate: false }),
  (req, res) => {
    const twiml = new VoiceResponse();

    twiml.say('Listen to your recorded message.');
    twiml.play({}, req.body.RecordingUrl);
    twiml.say('Goodbye.');

    res.end(twiml.toString());
  }
);

app.use('/', router);

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
