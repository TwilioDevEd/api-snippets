require('dotenv').load();
var http = require('http');
var express = require('express');

var AccessToken = require('twilio').jwt.AccessToken;
var VideoGrant = AccessToken.VideoGrant;

// Create Express webapp
var app = express();

app.get('/', function(request, response) {
    // Create an access token which we will sign and return to the client,
    // containing the grant we just created
    var token = new AccessToken(
        process.env.TWILIO_ACCOUNT_SID,
        process.env.TWILIO_API_KEY,
        process.env.TWILIO_API_SECRET
    );

    // Assign identity to the token
    token.identity = request.query.identity || 'identity';

    // Grant the access token Twilio Video capabilities
    var grant = new VideoGrant();
    grant.room = request.query.room;
    token.addGrant(grant);

    // Serialize the token to a JWT string
    response.send(token.toJwt());
});

// Create http server and run it
var server = http.createServer(app);
var port = process.env.PORT || 3000;
server.listen(port, function() {
    console.log('Express server running on *:' + port);
});
