<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Pricing_Services_Twilio($sid, $token);

$number = $client->voiceNumbers->get("+15108675310");

echo $number->outbound_call_price->current_price . "\n";
