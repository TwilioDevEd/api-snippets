let http = require('http');
let express = require('express');
let twilio = require('twilio');

let app = express();

app.post('/sms', function(req, res) {
  let twilio = require('twilio');
  let twiml = new twilio.TwimlResponse();
  twiml.message('The Robots are coming! Head for the hills!');
  res.writeHead(200, { 'Content-Type': 'text/xml' });
  res.end(twiml.toString());
});

http.createServer(app).listen(1337, function() {
  console.log('Express server listening on port 1337');
});
