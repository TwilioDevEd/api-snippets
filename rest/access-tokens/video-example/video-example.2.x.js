const AccessToken = require('twilio').AccessToken;
const VideoGrant = AccessToken.VideoGrant;

// Used when generating any kind of tokens
const twilioAccountSid = 'ACxxxxxxxxxx';
const twilioApiKey = 'SKxxxxxxxxxx';
const twilioApiSecret = 'xxxxxxxxxxxx';

// Used specifically for creating Video tokens
const configurationProfileSid = 'VSxxxxxxxxxxxxx';
const identity = 'user';

// Create a "grant" which enables a client to use Video as a given user
const videoGrant = new VideoGrant({
    configurationProfileSid: configurationProfileSid
});

// Create an access token which we will sign and return to the client,
// containing the grant we just created
const token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
token.addGrant(videoGrant);
token.identity = identity;

// Serialize the token to a JWT string
console.log(token.toJwt());
