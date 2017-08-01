<?php
include('./vendor/autoload.php');
include('./config.php');

use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\VideoGrant;

// Use identity and room from query string if provided
$identity = isset($_GET["identity"]) ? $_GET["identity"] : "identity";
$room = isset($_GET["room"]) ? $_GET["room"] :  "";

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
$grant->setRoom($room);
$token->addGrant($grant);

echo $token->toJWT();
