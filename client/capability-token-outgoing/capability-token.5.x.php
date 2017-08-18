<?php
include "vendor/autoload.php";

use Twilio\Jwt\ClientToken;

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';
$appSid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

$capability = new ClientToken($accountSid, $authToken);
$capability->allowClientOutgoing($appSid);
$token = $capability->generateToken();

echo $token;
