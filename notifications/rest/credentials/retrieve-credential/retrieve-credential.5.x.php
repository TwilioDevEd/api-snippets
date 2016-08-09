<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$credential = $client->notifications
    ->credentials("CRxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    ->fetch();

echo $credential->friendlyName;
