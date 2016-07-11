<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$feedback = $client
    ->account
    ->calls("CAe03b7cd806070d1f32bdb7f1046a41c0")
    ->feedback()
    ->create(
        3, array("issue" => "imperfect-audio")
    );

echo $feedback->dateCreated->format('Y-m-d H:i:s');
