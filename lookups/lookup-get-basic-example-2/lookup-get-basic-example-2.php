<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "{{ auth_token }}";
$client = new Lookups_Services_Twilio($sid, $token);

$number = $client->phone_numbers->get("(510) 867-5309", array("CountryCode" => "US", "Type" => "carrier"));

echo $number->carrier->type . "\r\n";
echo $number->carrier->name;
