<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\PlaybackGrant;
use Twilio\Rest\Client;

// Required for all Twilio access tokens
// To set up environmental variables, see http://twil.io/secure
$twilioAccountSid = getenv('TWILIO_ACCOUNT_SID');
$twilioApiKey = getenv('TWILIO_API_KEY');
$twilioApiSecret = getenv('TWILIO_API_KEY_SECRET');

$twilio = new Client($twilioApiKey, $twilioApiSecret, $twilioAccountSid);

// Create access token, which we will serialize and send to the client
$token = new AccessToken(
    $twilioAccountSid,
    $twilioApiKey,
    $twilioApiSecret,
    3600
);

//Create a PlaybackGrant resource for a specific PlayerStreamer
// via the REST API
 $playbackGrant = $twilio->media->v1->playerStreamer("VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                    ->playbackGrant()
                                    ->create(["ttl" => 60]);

// Wrap the grant you received from the API
// in a PlaybackGrant object
$wrappedPlaybackGrant = new PlaybackGrant();
$wrappedPlaybackGrant->setGrant($playbackGrant->grant);

// Attach the PlaybackGrant to the Access Token
$token->addGrant($wrappedPlaybackGrant);

// render token to string
echo $token->toJWT();
