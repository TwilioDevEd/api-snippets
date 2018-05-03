const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const twilio = require('twilio');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/token', (req, res) => {
  // put your Twilio API credentials here
  const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  const authToken = 'your_auth_token';

  // put your Twilio Application Sid here
  const appSid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

  const capability = new twilio.Capability(accountSid, authToken);
  capability.allowClientOutgoing(appSid);
  capability.allowClientIncoming(req.body.ClientName);
  const token = capability.generate();

  res.set('Content-Type', 'application/jwt');
  res.send(token);
});

app.post('/voice', (req, res) => {
  // TODO: Create TwiML response
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/');
