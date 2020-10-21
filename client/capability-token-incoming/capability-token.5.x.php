<?php
include "vendor/autoload.php";

use Twilio\Jwt\ClientToken;

// put your Twilio API credentials here
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken  = getenv('TWILIO_AUTH_TOKEN');

$capability = new ClientToken($accountSid, $authToken);
$capability->allowClientIncoming("joey");
$token = $capability->generateToken();

echo $token;