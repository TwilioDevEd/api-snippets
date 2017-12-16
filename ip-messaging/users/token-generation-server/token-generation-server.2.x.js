require('dotenv').load();
const http = require('http');
const path = require('path');
const AccessToken = require('twilio').AccessToken;
const IpMessagingGrant = AccessToken.IpMessagingGrant;
const express = require('express');
// Create Express webapp
const app = express();
app.use(express.static(path.join(__dirname, 'public')));

/*
Generate an Access Token for a chat application user - it generates a random
username for the client requesting a token, and takes a device ID as a query
parameter.
*/
app.get('/token', (request, response) => {
  const appName = 'TwilioChatDemo';
  const identity = 'John Doe';
  const deviceId = request.query.device;

  // Create a unique ID for the client on their current device
  const endpointId = appName + ':' + identity + ':' + deviceId;

  // Create a "grant" which enables a client to use IPM as a given user,
  // on a given device
  const ipmGrant = new IpMessagingGrant({
    serviceSid: process.env.TWILIO_IPM_SERVICE_SID,
    endpointId: endpointId,
  });

  // Create an access token which we will sign and return to the client,
  // containing the grant we just created
  const token = new AccessToken(
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
const server = http.createServer(app);
const port = process.env.PORT || 3000;
server.listen(port, () => {
  console.log('Express server running on *:' + port);
});
