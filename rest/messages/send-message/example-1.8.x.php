<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

$client->messages->create(
    "+15558675310",
    array(
        'from' => '+15017122661',
        'body' => "This is the ship that made the Kessel Run in fourteen parsecs?",
        'mediaUrl' => "https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg",
    )
);
