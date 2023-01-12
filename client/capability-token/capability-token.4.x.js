const http = require('http');
const express = require('express');
const ClientCapability = require('twilio').jwt.ClientCapability;

const app = express();

app.get('/token', (req, res) => {
  // put your Twilio API credentials here
  // To set up environmental variables, see http://twil.io/secure
  const accountSid = process.env.TWILIO_ACCOUNT_SID;
  const authToken = process.env.TWILIO_AUTH_TOKEN;

  // put your Twilio Application Sid here
  const appSid = process.env.TWILIO_APP_SID;

  const capability = new ClientCapability({
    accountSid: accountSid,
    authToken: authToken,
  });
  capability.addScope(
    new ClientCapability.OutgoingClientScope({ applicationSid: appSid })
  );
  capability.addScope(new ClientCapability.IncomingClientScope('joey'));
  const token = capability.toJwt();

  res.set('Content-Type', 'application/jwt');
  res.send(token);
});

app.post('/voice', (req, res) => {
  // TODO: Create TwiML response
});

http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/token/');
