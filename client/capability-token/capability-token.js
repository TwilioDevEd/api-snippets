var http = require('http'),
    twilio = require('twilio');

http.createServer(function (req, res) {
  // put your Twilio API credentials here
  var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  var authToken = "your_auth_token";

  // put your Twilio Application Sid here
  var appSid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  var capability = new twilio.Capability(accountSid, authToken);
  capability.allowClientOutgoing(appSid);
  capability.allowClientIncoming("jenny");
  var token = capability.generate();

  res.end(token);
}).listen(1337, '127.0.0.1');

console.log('Token servin\' server running at http://127.0.0.1:1337/');