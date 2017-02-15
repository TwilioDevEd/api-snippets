<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$client->messages->create(
    '+15558675309',
    array(
        'from' => '+15017250604',
        'body' => "McAvoy or Stewart? These timelines can get so confusing.",
        'statusCallback' => "http://requestb.in/1234abcd"
    )
);
