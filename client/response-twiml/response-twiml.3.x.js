const http = require('http');
const express = require('express');
const twilio = require('twilio');

const app = express();

app.post('/voice', function(req, res) {
    // Create TwiML response
    let twiml = new twilio.TwimlResponse();  // FIXME: hows the class now?
    twiml.say('Thanks for calling!');

    res.set('Content-Type', 'text/xml');
    res.send(twiml.toString());
});

app.get('/token', function(req, res) {
  // TODO: generate token
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/voice/');
