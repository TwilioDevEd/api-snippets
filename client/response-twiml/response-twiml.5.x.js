const http = require('http');
const express = require('express');
const VoiceResponse = require('twilio').twiml.VoiceResponse;

const app = express();

app.post('/voice', (req, res) => {
  // Create TwiML response
  const twiml = new VoiceResponse();
  twiml.say('Thanks for calling!');

  res.set('Content-Type', 'text/xml');
  res.send(twiml.toString());
});

app.get('/token', (req, res) => {
  // TODO: generate token
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/voice/');
