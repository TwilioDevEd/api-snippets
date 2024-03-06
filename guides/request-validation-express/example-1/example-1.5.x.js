// You can find your Twilio Auth Token here: https://www.twilio.com/console
// Set at runtime as follows:
// $ TWILIO_AUTH_TOKEN=XXXXXXXXXXXXXXXXXXX node index.js
//
// This will not work unless you set the TWILIO_AUTH_TOKEN environment
// variable.

const twilio = require('twilio');
const app = require('express')();
const bodyParser = require('body-parser');
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const MessagingResponse = require('twilio').twiml.MessagingResponse;

app.use(bodyParser.urlencoded({ extended: false }));

app.post('/voice', twilio.webhook(), (req, res) => {
  // Twilio Voice URL - receives incoming calls from Twilio
  const response = new VoiceResponse();

  response.say(
    `Thanks for calling!
     Your phone number is ${req.body.From}. I got your call because of Twilio´s
     webhook. Goodbye!`
  );

  res.set('Content-Type', 'text/xml');
  res.send(response.toString());
});

app.post('/message', twilio.webhook(), (req, res) => {
  // Twilio Messaging URL - receives incoming messages from Twilio
  const response = new MessagingResponse();

  response.message(`Your text to me was ${req.body.Body.length} characters long.
                    Webhooks are neat :)`);

  res.set('Content-Type', 'text/xml');
  res.send(response.toString());
});

app.listen(3000);
