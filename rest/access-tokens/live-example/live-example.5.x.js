const AccessToken = require('twilio').jwt.AccessToken;
const PlaybackGrant = AccessToken.PlaybackGrant;

// Used when generating any kind of tokens
// To set up environmental variables, see http://twil.io/secure
const twilioAccountSid = process.env.TWILIO_ACCOUNT_SID;
const twilioApiKey = process.env.TWILIO_API_KEY;
const twilioApiSecret = process.env.TWILIO_API_SECRET;

// Initialize a Twilio client
const client = require('twilio')(twilioApiKey, twilioApiSecret, {
    accountSid: twilioAccountSid });

// Create an access token which you will sign and return to the client,
// containing the grant you will create in the next steps
const token = new AccessToken(
  twilioAccountSid,
  twilioApiKey,
  twilioApiSecret
);

// Create a PlaybackGrant resource for a specific PlayerStreamer
// via the REST API
client.media.playerStreamer('VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    .playbackGrant()
    .create({ttl: 60})
    .then(playbackGrant => {
        // Wrap the PlaybackGrant that you received from the REST API
        // in a PlaybackGrant object and then attach that wrapped
        // grant to your Access Token
        const wrappedPlaybackGrant = new PlaybackGrant({
          grant: playbackGrant.grant
        });
        token.addGrant(wrappedPlaybackGrant);
        // Serialize the token to a JWT string
        console.log(token.toJwt());
      }
    );
