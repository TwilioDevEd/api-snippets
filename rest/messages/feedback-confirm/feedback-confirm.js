// Twilio Credentials 
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
var authToken = 'your_auth_token'; 

//require the Twilio module and create a REST client 
var client = require('twilio')(accountSid, authToken); 

var http = require('http'),
    express = require('express');

var app = express();

app.get('/confirm', function(req, res) {
  var uniqueId = req.query.id;
  // Lookup variable `uniqueId` in a database to find messageSid
  var messageSid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

  // Send Feedback to Twilio
  client.request({
    url: '/Accounts/' + accountSid + '/Messages/' + messageSid + '/Feedback',
    method: 'POST',
    form: {
      Outcome: "confirmed"
    }
  }, function (err, data) {

    // Handle remaining request normally
    res.send('Thank you!');
    res.end();

  });
});

http.createServer(app).listen(1337, function () {
    console.log('Express server listening on port 1337');
});