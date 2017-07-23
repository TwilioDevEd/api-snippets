var AccessToken = require('twilio').AccessToken;
var IpMessagingGrant = AccessToken.IpMessagingGrant;

// Used when generating any kind of tokens
var twilioAccountSid = 'ACxxxxxxxxxx';
var twilioApiKey = 'SKxxxxxxxxxx';
var twilioApiSecret = 'xxxxxxxxxxxx';

// Used specifically for creating IP Messaging tokens
var serviceSid = 'ISxxxxxxxxxxxxx';
var appName = 'HipFlowSlackDockRC';
var identity = 'user@example.com';
var deviceId = 'someiosdeviceid';
var endpointId = appName + ':' + identity + ':' + deviceId;

// Create a "grant" which enables a client to use IPM as a given user,
// on a given device
var ipmGrant = new IpMessagingGrant({
  serviceSid: serviceSid,
  endpointId: endpointId,
});

// Create an access token which we will sign and return to the client,
// containing the grant we just created
var token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
token.addGrant(ipmGrant);
token.identity = identity;

// Serialize the token to a JWT string
console.log(token.toJwt());
