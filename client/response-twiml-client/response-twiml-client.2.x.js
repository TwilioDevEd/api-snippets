const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const twilio = require('twilio');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));

app.post('/voice', (req, res) => {
  // Create TwiML response
  const twiml = new twilio.TwimlResponse();

  if (req.body.To) {
    twiml.dial({ callerId: '+15017122661' }, function() {
      // wrap the phone number or client name in the appropriate TwiML verb
      // by checking if the number given has only digits and format symbols
      if (/^[\d\+\-\(\) ]+$/.test(req.body.To)) {
        this.number(req.body.To);
      } else {
        this.client(req.body.To);
      }
    });
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
console.log('Twilio Client app server running at http://127.0.0.1:1337/');
