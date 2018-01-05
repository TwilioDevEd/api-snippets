<?php
include 'Services/Twilio/Capability.php';

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';
$appSid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

$capability = new Services_Twilio_Capability($accountSid, $authToken);
$capability->allowClientOutgoing($appSid);
$capability->allowClientIncoming('joey');
$token = $capability->generateToken();

echo $token;