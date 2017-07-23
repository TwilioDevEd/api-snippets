let AccessToken = require('twilio').AccessToken;
let IpMessagingGrant = AccessToken.IpMessagingGrant;

// Used when generating any kind of tokens
let twilioAccountSid = 'ACxxxxxxxxxx';
let twilioApiKey = 'SKxxxxxxxxxx';
let twilioApiSecret = 'xxxxxxxxxxxx';

// Used specifically for creating IP Messaging tokens
let serviceSid = 'ISxxxxxxxxxxxxx';
let appName = 'HipFlowSlackDockRC';
let identity = 'user@example.com';
let deviceId = 'someiosdeviceid';
let endpointId = appName + ':' + identity + ':' + deviceId;

// Create a "grant" which enables a client to use IPM as a given user,
// on a given device
let ipmGrant = new IpMessagingGrant({
  serviceSid: serviceSid,
  endpointId: endpointId,
});

// Create an access token which we will sign and return to the client,
// containing the grant we just created
let token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
token.addGrant(ipmGrant);
token.identity = identity;

// Serialize the token to a JWT string
console.log(token.toJwt());
