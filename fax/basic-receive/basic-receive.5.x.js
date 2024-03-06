const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

// Parse any incoming POST parameters
app.use(bodyParser({ extended: false }));

// Define a handler for when the fax is initially sent
app.post('/fax/sent', (req, res) => {
  // Let's manually build some TwiML. We can choose to receive the
  // fax with <Receive>, or reject with <Reject>.
  const twiml = `
  <Response>
    <Receive action="/fax/received"/>
  </Response>
  `;

  // Send Fax twiml response
  res.type('text/xml');
  res.send(twiml);
});

// Define a handler for when the fax is finished sending to us - if successful,
// We will have a URL to the contents of the fax at this point
app.post('/fax/received', (req, res) => {
  // log the URL of the PDF received in the fax
  console.log(req.body.MediaUrl);

  // Respond with empty 200/OK to Twilio
  res.status(200);
  res.send();
});

// Start the web server
http.createServer(app).listen(3000, () => {
  console.log('Express server listening on port 3000');
});
