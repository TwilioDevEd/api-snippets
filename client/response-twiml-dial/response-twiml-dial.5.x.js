const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const VoiceResponse = require('twilio').twiml.VoiceResponse;

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));

app.post('/voice', (req, res) => {
  // Create TwiML response
  const twiml = new VoiceResponse();

  if (req.body.To) {
    const dial = twiml.dial({ callerId: '+15017122661' });
    dial.number(req.body.To);
  } else {
    twiml.say('Thanks for calling!');
  }

  res.set('Content-Type', 'text/xml');
  res.send(twiml.toString());
});

app.get('/token', (req, res) => {
  // TODO: generate token
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/voice/');
