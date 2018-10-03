<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

$client = new Client($sid, $token);

$country = $client->pricing->v2->voice->countries("EE")->fetch();

foreach ($country->inboundCallPrices as $p) {
    echo "{$p["number_type"]} {$p["current_price"]}\n";
}
