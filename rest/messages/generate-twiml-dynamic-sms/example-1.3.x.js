const http = require('http');
const express = require('express');
const twilio = require('twilio');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser());

app.post('/', (req, res) => {
  const twiml = new twilio.TwimlResponse();

  if (req.body.Body == 'hello') {
    twiml.message('Hi!');
  } else if(req.body.Body == 'bye') {
    twiml.message('Goodbye');
  } else {
    twiml.message('No Body param match, Twilio sends this in the request to your server.');
  }

  res.writeHead(200, {'Content-Type': 'text/xml'});
  res.end(twiml.toString());
});

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
