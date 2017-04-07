var http = require('http'),
    express = require('express'),
    session = require('express-session'),
    twilio = require('twilio');

var app = express();
app.use(session({ secret: 'anything-you-want-but-keep-secret' }));

app.post('/sms', function(req, res) {
  var smsCount = req.session.counter || 0;

  var message = 'Hello, thanks for the new message.';
  if(smsCount > 0) {
    message = 'Hello, thanks for message number ' + (smsCount + 1);
  }
  
  req.session.counter = smsCount + 1;

  var twiml = new twilio.TwimlResponse();
  twiml.message(message);
  res.writeHead(200, {'Content-Type': 'text/xml'});
  res.end(twiml.toString());
});

http.createServer(app).listen(1337, function () {
  console.log("Express server listening on port 1337");
});