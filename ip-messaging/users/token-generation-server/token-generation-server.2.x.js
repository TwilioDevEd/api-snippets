require('dotenv').load();
let http = require('http');
let path = require('path');
let AccessToken = require('twilio').AccessToken;
let IpMessagingGrant = AccessToken.IpMessagingGrant;
let express = require('express');
// Create Express webapp
let app = express();
app.use(express.static(path.join(__dirname, 'public')));

/*
Generate an Access Token for a chat application user - it generates a random
username for the client requesting a token, and takes a device ID as a query
parameter.
*/
app.get('/token', function(request, response) {
  let appName = 'TwilioChatDemo';
  let identity = 'John Doe';
  let deviceId = request.query.device;

  // Create a unique ID for the client on their current device
  let endpointId = appName + ':' + identity + ':' + deviceId;

  // Create a "grant" which enables a client to use IPM as a given user,
  // on a given device
  let ipmGrant = new IpMessagingGrant({
    serviceSid: process.env.TWILIO_IPM_SERVICE_SID,
    endpointId: endpointId,
  });

  // Create an access token which we will sign and return to the client,
  // containing the grant we just created
  let token = new AccessToken(
    process.env.TWILIO_ACCOUNT_SID,
    process.env.TWILIO_API_KEY,
    process.env.TWILIO_API_SECRET
  );
  token.addGrant(ipmGrant);
  token.identity = identity;

  // Serialize the token to a JWT string and include it in a JSON response
  response.send({
    identity: identity,
    token: token.toJwt(),
  });
});

// Create http server and run it
let server = http.createServer(app);
let port = process.env.PORT || 3000;
server.listen(port, function() {
  console.log('Express server running on *:' + port);
});
