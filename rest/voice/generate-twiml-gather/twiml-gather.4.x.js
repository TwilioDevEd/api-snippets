const http = require('http');
const express = require('express');
const router = express.Router();
const app = express();
const VoiceResponse = require('twilio').twiml.VoiceResponse;

// POST: '/voice'
router.post('/voice', twilio.webhook({ validate: false }), (req, res) => {
  const twiml = new VoiceResponse();

  const gather = twiml.gather({
    action: 'voice/handle-record',
    numDigits: '1',
    method: 'POST',
  });

  res.send(twiml);
});

app.use('/', router);

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
