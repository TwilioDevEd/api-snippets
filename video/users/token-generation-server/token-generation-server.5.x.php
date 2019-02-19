<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\ConversationsGrant;

// Required for all Twilio access tokens
$twilioAccountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$twilioApiKey = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$twilioApiSecret = 'your_api_secret';
$TwilioConfigurationSid = 'VSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
// choose a random username for the connecting user
$identity = 'randomUsername';

// Create access token, which we will serialize and send to the client
$token = new AccessToken(
    $TWILIO_ACCOUNT_SID,
    $TWILIO_API_KEY,
    $TWILIO_API_SECRET,
    3600,
    $identity
);

// Grant access to Video
$grant = new VideoGrant();
$grant->setConfigurationProfileSid($TwilioConfigurationSid);
$token->addGrant($grant);

// return serialized token and the user's randomly generated ID
echo json_encode(
    array(
        'identity' => $identity,
        'token' => $token->toJWT(),
    )
);
