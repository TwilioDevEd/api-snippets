<?php
// Get the PHP helper library from twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Lookups_Services_Twilio($sid, $token);

$number = $client->phone_numbers->get("+15108675309");

echo $number->national_format;
