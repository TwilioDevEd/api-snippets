const http = require('http');
const express = require('express');
const session = require('express-session');
const twilio = require('twilio');

const app = express();
app.use(session({ secret: 'anything-you-want-but-keep-secret' }));

app.post('/sms', function(req, res) {
  const smsCount = req.session.counter || 0;

  let message = 'Hello, thanks for the new message.';
  if (smsCount > 0) {
    message = 'Hello, thanks for message number ' + (smsCount + 1);
  }

  req.session.counter = smsCount + 1;

  const twiml = new twilio.TwimlResponse();
  twiml.message(message);
  res.writeHead(200, { 'Content-Type': 'text/xml' });
  res.end(twiml.toString());
});

http.createServer(app).listen(1337, function() {
  console.log('Express server listening on port 1337');
});
