<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/twilio-php/Services/Twilio.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

$client = new Client($sid, $token);

$messagingCountries = $client->pricing->messaging()->countries->stream();

foreach ($messagingCountries as $c) {
    echo $c->isoCountry . PHP_EOL;
}
