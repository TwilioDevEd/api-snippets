<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\VoiceGrant;

// Required for all Twilio access tokens
$twilioAccountSid = 'ACxxxxxxxxxxxx';
$twilioApiKey = 'SKxxxxxxxxxxxx';
$twilioApiSecret = 'xxxxxxxxxxxxxx';

// Required for Voice grant
$outgoingApplicationSid = 'APxxxxxxxxxxxx';
$pushCredentialSid = 'CRxxxxxxxxxxxx';
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

// Create Voice grant
$voiceGrant = new VoiceGrant();
$voiceGrant->setOutgoingApplicationSid($outgoingApplicationSid);
$voiceGrant->setPushCredentialSid($pushCredentialSid);

// Add grant to token
$token->addGrant($voiceGrant);

// render token to string
echo $token->toJWT();
