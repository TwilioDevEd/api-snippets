// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');
var express = require('express');
var app = express();

app.post('/enqueue_call', function(request, response) {
  var resp = new twilio.TwimlResponse();
  resp.enqueue({ workflowSid: 'WW0123456789abcdef0123456789abcdef' });

  response.setHeader('Content-Type', 'application/xml');
  response.write(resp.toString());
  response.end();
});

app.listen(8080);
