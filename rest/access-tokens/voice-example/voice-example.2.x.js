const AccessToken = require('twilio').AccessToken;
const VoiceGrant = AccessToken.VoiceGrant;

// Used when generating any kind of tokens
const twilioAccountSid = 'ACxxxxxxxxxx';
const twilioApiKey = 'SKxxxxxxxxxx';
const twilioApiSecret = 'xxxxxxxxxxxx';

// Used specifically for creating Voice tokens
const outgoingApplicationSid = 'APxxxxxxxxxxxxx';
const identity = 'user';

// Create a "grant" which enables a client to use Voice as a given user
const voiceGrant = new VoiceGrant({
  outgoingApplicationSid: outgoingApplicationSid,
});

// Create an access token which we will sign and return to the client,
// containing the grant we just created
const token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
token.addGrant(voiceGrant);
token.identity = identity;

// Serialize the token to a JWT string
console.log(token.toJwt());
