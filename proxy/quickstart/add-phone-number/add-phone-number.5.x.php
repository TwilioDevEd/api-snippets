<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require './vendor/autoload.php';
use Twilio\Rest\Client;
// Get your Account SID and Auth Token from https://twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
// Initialize the client
$client = new Client($sid, $token);
$phoneNumber = $client
    ->preview
    ->proxy
    ->services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->phoneNumbers->create(
        array(
            'sid' => "PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        )
    );

echo $phoneNumber->sid;
