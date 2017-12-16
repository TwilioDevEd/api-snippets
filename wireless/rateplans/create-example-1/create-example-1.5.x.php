<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$ratePlan = $client->wireless->ratePlans->create([
    'uniqueName' => 'SmartMeterCA',
    'friendlyName' => 'California SmartMeter Plan',
    'dataLimit' => 5,
    'messagingEnabled' => true
]);

print_r($ratePlan);
