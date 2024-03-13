// Twilio Credentials
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

const http = require('http');
const express = require('express');

const app = express();

app.get('/confirm', (req, res) => {
  const uniqueId = req.query.id;

  // Lookup constiable `uniqueId` in a database to find messageSid
  const messageSid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

  // Send Feedback to Twilio
  client
    .messages(messageSid)
    .feedback.create({
      outcome: 'confirmed',
    })
    .then(() => {
      // Handle remaining request normally
      res.send('Thank you!');
      res.end();
    })
    .catch(err => {
      res.status(500);
      res.send(err.toString());
    })
    .done();
});

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
