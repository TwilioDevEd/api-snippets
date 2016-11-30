var twilio = require('twilio');
// You can find your Twilio Auth Token here: https://www.twilio.com/console
// Which can be set at runtime as follows:
// $ TWILIO_AUTH_TOKEN=XXXXXXXXXXXXXXXXXXX node index.js
var TWILIO_AUTH_TOKEN = process.env.TWILIO_AUTH_TOKEN

function validateTwilioRequest() {
  var routes = Array.prototype.slice.call(arguments);

  return function(req, res, next) {
    // disable this middleware when testing
    if (process.env.NODE_ENV == 'test') {
      return next();
    }

    var shouldValidateRequest = false;

    routes.forEach(function(route) {
      // Ensure this middleware is initialized properly:
      // i.e. app.use(validateTwilioRequest('/voice', '/message'));
      if (typeof route !== 'string') {
        throw new Error('This middleware only accepts urls as strings.');
      }

      if (shouldValidateRequest) {
        return;
      } else {
        shouldValidateRequest = req.url.indexOf(route) > -1;
      }
    });

    if (shouldValidateRequest) {
      if (twilio.validateExpressRequest(req, TWILIO_AUTH_TOKEN)) {
        next();
      } else {
        res
        .type('text/plain')
        .status(403)
        .send('You are not Twilio >:/');
      }
    } else {
      next();
    }
  };
}

var app = require('express')();
var bodyParser = require('body-parser');
// var twilio = require('twilio');
var TwimlResponse = twilio.TwimlResponse;

app.use(bodyParser.urlencoded({extended: false}));

app.use(validateTwilioRequest('/voice', '/message'));

app.post('/voice', function(req, res) {
  // Twilio Voice URL - receives incoming calls from Twilio
  var response = new TwimlResponse();

  response.say(
    `Thanks for calling!
     Your phone number is ${req.body.From}. I got your call because of Twilio´s webhook.
     Goodbye!`
  );

  res.send(response.toString());
});

app.post('/message', function(req, res) {
  // Twilio Messaging URL - receives incoming messages from Twilio
  var response = new TwimlResponse();

  response.message(`Your text to me was ${req.body.Body.length} characters long. Webhooks are neat :)`);

  res.send(response.toString());
});

app.listen(3000);
