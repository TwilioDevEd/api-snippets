<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$client->account->messages->create(
    "+16518675309",
    "+14158141829",
    array(
        'body' => "Hey Jenny! Good luck on the bar exam!",
        'mediaUrl' => "http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg",
    )
);
