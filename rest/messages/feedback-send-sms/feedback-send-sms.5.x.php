<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// TODO: Confirm passing provideFeedback works
$client->messages->create(
    '+15558675310',
    array(
        'from' => '+15017250604',
        'body' => "Open to confirm: http://yourserver.com/confirm?id=1234567890",
        'provideFeedback' => true
    )
);
