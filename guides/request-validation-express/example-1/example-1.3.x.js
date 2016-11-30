// You can find your Twilio Auth Token here: https://www.twilio.com/console
// Which can be set at runtime as follows:
// $ TWILIO_AUTH_TOKEN=XXXXXXXXXXXXXXXXXXX node index.js
// Please note that this will not work unless you set the TWILIO_AUTH_TOKEN
// environment variable.
var twilio = require('twilio');
var app = require('express')();
var bodyParser = require('body-parser');
var TwimlResponse = twilio.TwimlResponse;

app.use(bodyParser.urlencoded({extended: false}));

app.post('/voice', twilio.webhook(), function(req, res) {
  // Twilio Voice URL - receives incoming calls from Twilio
  var response = new TwimlResponse();

  response.say(
    `Thanks for calling!
     Your phone number is ${req.body.From}. I got your call because of Twilio´s webhook.
     Goodbye!`
  );

  res.send(response.toString());
});

app.post('/message', twilio.webhook(), function(req, res) {
  // Twilio Messaging URL - receives incoming messages from Twilio
  var response = new TwimlResponse();

  response.message(`Your text to me was ${req.body.Body.length} characters long. Webhooks are neat :)`);

  res.send(response.toString());
});

app.listen(3000);
