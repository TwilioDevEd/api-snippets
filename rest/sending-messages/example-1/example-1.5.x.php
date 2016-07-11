<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$client->account
    ->messages
    ->create(
        "+15558675309", "+14158141829",
        array(
            "body" => "Jenny please?! I love you <3",
            "mediaUrl" => "http://www.example.com/hearts.png"
        )
    );
