const AccessToken = require('twilio').jwt.AccessToken;
const ChatGrant = AccessToken.ChatGrant;

// Used when generating any kind of tokens
const twilioAccountSid = 'ACxxxxxxxxxx';
const twilioApiKey = 'SKxxxxxxxxxx';
const twilioApiSecret = 'xxxxxxxxxxxx';

// Used specifically for creating Chat tokens
const serviceSid = 'ISxxxxxxxxxxxxx';
const appName = 'HipFlowSlackDockRC';
const identity = 'user@example.com';
const deviceId = 'someiosdeviceid';
const endpointId = `${appName}:${identity}:${deviceId}`;

// Create a "grant" which enables a client to use Chat as a given user,
// on a given device
const chatGrant = new ChatGrant({
  serviceSid: serviceSid,
  endpointId: endpointId,
});

// Create an access token which we will sign and return to the client,
// containing the grant we just created
const token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);

token.addGrant(chatGrant);

token.identity = identity;

// Serialize the token to a JWT string
console.log(token.toJwt());
