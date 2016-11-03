
const express = require('express');
const twilio = require('twilio');
const urlencoded = require('body-parser').urlencoded;

let app = express();

// Parse incoming POST params with Express middleware
app.use(urlencoded({extended: false}));

// Create a route that will handle Twilio webhook requests, sent as an
// HTTP POST to /voice in our application
app.post('/voice', (request, response) => {
  // Use the Twilio Node.js SDK to build an XML response
  let twiml = new twilio.TwimlResponse();

  // Use the <Gather> verb to collect user input
  twiml.gather({numDigits: 1}, (gatherNode) => {
    gatherNode.say('For sales, press 1. For support, press 2.');
  });

  // If the user doesn't enter input, loop
  twiml.redirect('/voice');

  // Render the response as XML in reply to the webhook request
  response.type('text/xml');
  response.send(twiml.toString());
});

// Create an HTTP server and listen for requests on port 3000
console.log('Twilio Client app HTTP server running at http://127.0.0.1:3000');
app.listen(3000);
