<?php
include 'Services/Twilio/Capability.php';

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

$capability = new Services_Twilio_Capability($accountSid, $authToken);
$capability->allowClientIncoming("joey");
$token = $capability->generateToken();

echo $token;