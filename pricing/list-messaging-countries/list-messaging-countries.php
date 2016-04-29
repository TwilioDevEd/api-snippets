<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "{{ auth_token }}";

$client = new Pricing_Services_Twilio($sid, $token);

foreach ($client->messagingCountries as $c) {
    echo $c->iso_country . "\n";
}
