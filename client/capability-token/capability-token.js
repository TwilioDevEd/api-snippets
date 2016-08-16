var express = require('express');
var http = require('http');
var Twilio = require('twilio');

var app = express();

app.get('/token', function(request, response) {
  // put your Twilio API credentials here
  var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  var authToken = "your_auth_token";

  // put your Twilio Application Sid here
  var appSid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  var capability = new Twilio.Capability(accountSid, authToken);
  capability.allowClientOutgoing(appSid);
  capability.allowClientIncoming("jenny");
  var token = capability.generate();

  response.send(token);
});

var port = process.env.port || 3000;
http.createServer(app).listen(port, function() {
    console.log('Node server listening on port ' + port);
});
