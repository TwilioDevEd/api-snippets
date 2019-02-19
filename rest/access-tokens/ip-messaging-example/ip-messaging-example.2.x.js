const AccessToken = require('twilio').AccessToken;
const IpMessagingGrant = AccessToken.IpMessagingGrant;

// Used when generating any kind of tokens
const twilioAccountSid = 'ACxxxxxxxxxx';
const twilioApiKey = 'SKxxxxxxxxxx';
const twilioApiSecret = 'xxxxxxxxxxxx';

// Used specifically for creating IP Messaging tokens
const serviceSid = 'ISxxxxxxxxxxxxx';
const identity = 'user@example.com';

// Create a "grant" which enables a client to use IPM as a given user,
// on a given device
const ipmGrant = new IpMessagingGrant({
  serviceSid: serviceSid,
});

// Create an access token which we will sign and return to the client,
// containing the grant we just created
const token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
token.addGrant(ipmGrant);
token.identity = identity;

// Serialize the token to a JWT string
console.log(token.toJwt());
