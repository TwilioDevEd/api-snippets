// This example uses JavaScript language features present in Node.js 6+
'use strict';

const express = require('express');
const twilio = require('twilio');
const urlencoded = require('body-parser').urlencoded;

const app = express();

// Parse incoming POST params with Express middleware
app.use(urlencoded({ extended: false }));

// Create a route that will handle Twilio webhook requests, sent as an
// HTTP POST to /voice in our application
app.post('/voice', (request, response) => {
  // Get the caller's first name (if it's available from whitepages pro)
  const addOnsData = JSON.parse(request.body.AddOns);
  const proData = addOnsData.results.whitepages_pro_caller_id.result.results[0];
  let firstName = 'home slice';

  if (proData.belongs_to[0]) {
    const person = proData.belongs_to[0];
    const nameData = person.names[0];
    if (nameData) firstName = nameData.first_name || firstName;
  }

  // Use the Twilio Node.js SDK to build an XML response
  const twiml = new twilio.TwimlResponse();
  twiml.say(`Never gonna give you up ${firstName}.`, {
    voice: 'alice',
  });
  twiml.play('https://demo.twilio.com/docs/classic.mp3');

  // Render the response as XML in reply to the webhook request
  response.type('text/xml');
  response.send(twiml.toString());
});

// Create an HTTP server and listen for requests on port 3000
app.listen(3000);
