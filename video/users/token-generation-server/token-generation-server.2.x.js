require('dotenv').load();
var http = require('http');
var path = require('path');
var AccessToken = require('twilio').AccessToken;
var ConversationsGrant = AccessToken.ConversationsGrant;
var express = require('express');
var randomUsername = require('./randos');

// Create Express webapp
var app = express();
app.use(express.static(path.join(__dirname, 'public')));

app.get('/token', function(request, response) {
  var identity = randomUsername();

  // Create an access token which we will sign and return to the client,
  // containing the grant we just created
  var token = new AccessToken(
    process.env.TWILIO_ACCOUNT_SID,
    process.env.TWILIO_API_KEY,
    process.env.TWILIO_API_SECRET
  );

  //assign the generated identity to the token
  token.identity = identity;

  //grant access to Video
  var grant = new VideoGrant();
  grant.configurationProfileSid = process.env.TWILIO_CONFIGURATION_SID;
  token.addGrant(grant);

  // Serialize the token to a JWT string and include it in a JSON response
  response.send({
    identity: identity,
    token: token.toJwt(),
  });
});

// Create http server and run it
var server = http.createServer(app);
var port = process.env.PORT || 3000;
server.listen(port, function() {
  console.log('Express server running on *:' + port);
});
