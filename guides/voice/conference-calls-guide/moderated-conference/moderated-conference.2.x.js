// This example uses JavaScript language features present in Node.js 6+
'use strict';

const express = require('express');
const twilio = require('twilio');
const urlencoded = require('body-parser').urlencoded;

// Update with your own phone number in E.164 format
const MODERATOR = '+15558675310';

const app = express();

// Parse incoming POST params with Express middleware
app.use(urlencoded({ extended: false }));

// Create a route that will handle Twilio webhook requests, sent as an
// HTTP POST to /voice in our application
app.post('/voice', (request, response) => {
  // Use the Twilio Node.js SDK to build an XML response
  const twiml = new twilio.TwimlResponse();

  // Start with a <Dial> verb
  twiml.dial(dialNode => {
    // If the caller is our MODERATOR, then start the conference when they
    // join and end the conference when they leave
    if (request.body.From == MODERATOR) {
      dialNode.conference('My conference', {
        startConferenceOnEnter: true,
        endConferenceOnExit: true,
      });
    } else {
      // Otherwise have the caller join as a regular participant
      dialNode.conference('My conference', {
        startConferenceOnEnter: false,
      });
    }
  });

  // Render the response as XML in reply to the webhook request
  response.type('text/xml');
  response.send(twiml.toString());
});

// Create an HTTP server and listen for requests on port 3000
app.listen(3000);
