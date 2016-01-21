<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC3094732a3c49700934481addd5ce1659";
$token = "{{ auth_token }}";
$client = new Pricing_Services_Twilio($sid, $token);

$number = $client->voiceNumbers->get("+15108675309");

echo $number->outbound_call_price->current_price . "\n";
