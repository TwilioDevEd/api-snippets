const express = require('express');
const app = express();
const VoiceResponse = require('twilio').twiml.VoiceResponse;

app.all('/', (req, res) => {
  // Create TwiML response
  const twiml = new VoiceResponse();

  twiml.say('Hello from your pals at Twilio! Have fun.');

  res.type('xml');
  res.send(twiml.toString());
});

app.listen(1337, () => {
  console.log('TwiML server running at http://127.0.0.1:1337/');
});
