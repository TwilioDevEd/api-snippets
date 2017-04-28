const http = require('http');
const express = require('express');
const ClientCapability = require('twilio').jwt.ClientCapability;

const app = express();

app.get('/token', (req, res) => {
  // put your Twilio API credentials here
  const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  const authToken = 'your_auth_token';

  // put your Twilio Application Sid here
  const appSid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

  const capability = new ClientCapability({
    accountSid: accountSid,
    authToken: authToken
  });
  capability.addScope(
    new ClientCapability.OutgoingClientScope({applicationSid: appSid})
  );
  const token = capability.toJwt();

  res.set('Content-Type', 'application/jwt');
  res.send(token);
});

app.post('/voice', (req, res) => {
  // TODO: Create TwiML response
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/token/');
