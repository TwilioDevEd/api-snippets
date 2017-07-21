var http = require('http'),
    express = require('express'),
    twilio = require('twilio');

var app = express();

app.post('/voice', function (req, res) {
    // Create TwiML response
    var twiml = new twilio.TwimlResponse();
    twiml.say('Thanks for calling!');

    res.set('Content-Type', 'text/xml');
    res.send(twiml.toString());
});

app.get('/token', function(req, res) {
  // TODO: generate token
});
    
http.createServer(app).listen(1337, '127.0.0.1');
console.log('Twilio Client app server running at http://127.0.0.1:1337/');