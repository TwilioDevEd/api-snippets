const http = require('http');
const express = require('express');
const twilio = require('twilio');

const app = express();

app.post('/', (req, res) => {
  const twiml = new twilio.TwimlResponse();

  twiml.message('The Robots are coming! Head for the hills!');

  res.writeHead(200, {'Content-Type': 'text/xml'});
  res.end(twiml.toString());
});

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
