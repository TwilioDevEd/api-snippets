var http = require('http'),
  express = require('express'),
  twilio = require('twilio');

var app = express();

app.get('/token', function(req, res) {
  // put your Twilio API credentials here
  var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  var authToken = 'your_auth_token';

  var capability = new twilio.Capability(accountSid, authToken);
  capability.allowClientIncoming('jenny');
  var token = capability.generate();

  res.set('Content-Type', 'application/jwt');
  res.send(token);
});

app.post('/voice', function(req, res) {
  // TODO: Create TwiML response
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/');
