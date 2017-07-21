var http = require('http'),
    express = require('express'),
    bodyParser = require('body-parser'),
    twilio = require('twilio');

var app = express();
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/token', function(req, res) {
  // put your Twilio API credentials here
  var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  var authToken = 'your_auth_token';

  // put your Twilio Application Sid here
  var appSid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

  var capability = new twilio.Capability(accountSid, authToken);
  capability.allowClientOutgoing(appSid);
  capability.allowClientIncoming(req.body.ClientName);
  var token = capability.generate();

  res.set('Content-Type', 'application/jwt')
  res.send(token);
});

app.post('/voice', function (req, res) {
    // TODO: Create TwiML response
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/');