<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$sim = $client->preview->wireless
    ->sims("DEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
    ->update([
        'Status' => 'active',
        'CallbackUrl' => 'https://sim-manager.mycompany.com/sim-update-callback/AliceSmithSmartMeter',
        'CallbackMethod' => 'POST'
    ]);

print_r($sim);
