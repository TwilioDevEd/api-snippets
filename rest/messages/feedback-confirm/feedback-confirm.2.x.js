// Twilio Credentials
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

const http = require('http');
const express = require('express');

const app = express();

app.get('/confirm', (req, res) => {
  const uniqueId = req.query.id;
  // Lookup variable `uniqueId` in a database to find messageSid
  const messageSid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

  // Send Feedback to Twilio
  client.request(
    {
      url: '/Accounts/' + accountSid + '/Messages/' + messageSid + '/Feedback',
      method: 'POST',
      form: {
        Outcome: 'confirmed',
      },
    },
    (err, data) => {
      // Handle remaining request normally
      res.send('Thank you!');
      res.end();
    }
  );
});

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
