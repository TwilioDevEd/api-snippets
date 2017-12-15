<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$client->messages
    ->create(
        "+15558675309",
        array(
            "from" => "+14158141829",
            "body" => "Let's grab lunch at Milliways tomorrow!",
            "mediaUrl" => "http://www.example.com/cheeseburger.png"
        )
    );
