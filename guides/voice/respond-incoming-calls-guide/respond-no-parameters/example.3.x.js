
const express = require('express');
const twilio = require('twilio');

let app = express();

// Create a route that will handle Twilio webhook requests, sent as an
// HTTP POST to /twiml in our application
app.post((request, response) => {
  // Use the Twilio Node.js SDK to build an XML response
  let twiml = new twilio.TwimlResponse();
  twiml.say('hello world!', {voice: 'alice'});

  // Render the response as XML in reply to the webhook request
  response.type('text/xml');
  response.send(twiml.toString());
});

// Create an HTTP server and listen for requests on port 3000
app.listen(3000);
