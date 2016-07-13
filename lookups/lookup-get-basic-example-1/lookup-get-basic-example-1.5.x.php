<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/twilio-php/Services/Twilio.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

$client = new Client($sid, $token);

$number = $client->lookups->phoneNumbers()->getContext("+15108675309")
    ->fetch(array("type" => "carrier"));

echo $number->carrier["type"] . "\r\n";
echo $number->carrier["name"];
