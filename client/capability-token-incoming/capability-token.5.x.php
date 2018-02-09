<?php
include "vendor/autoload.php";

use Twilio\Jwt\ClientToken;

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

$capability = new ClientToken($accountSid, $authToken);
$capability->allowClientIncoming("joey");
$token = $capability->generateToken();

echo $token;