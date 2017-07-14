<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$recording_sid = "RE557ce644e5ab84fa21cc21112e22c485";
$client = new Client($sid, $token);

$client->api->v2010->accounts($sid)
                   ->recordings($recording_sid)->fetch();
