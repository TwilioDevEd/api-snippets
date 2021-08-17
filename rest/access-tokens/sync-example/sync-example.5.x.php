<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\SyncGrant;

// Required for all Twilio access tokens
// To set up environmental variables, see http://twil.io/secure
$twilioAccountSid = getenv('TWILIO_ACCOUNT_SID');
$twilioApiKey = getenv('TWILIO_API_KEY');
$twilioApiSecret = getenv('TWILIO_API_KEY_SECRET');
$twilioSyncService = getenv("TWILIO_SYNC_SERVICE_SID");


// Required for Sync grant
// An identifier for your app - can be anything you'd like
$identity = "john_doe";

// Create access token, which we will serialize and send to the client
$token = new AccessToken(
    $twilioAccountSid,
    $twilioApiKey,
    $twilioApiSecret,
    3600,
    $identity
);

// Create Sync grant
$syncGrant = new SyncGrant();

// Create a "grant" which enables a client to use Sync as a given user
$syncGrant->setServiceSid($twilioSyncService);


// Add grant to token
$token->addGrant($syncGrant);

// render token to string
echo $token->toJWT();
