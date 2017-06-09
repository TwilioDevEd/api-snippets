<?php
// This line loads the library
require './vendor/autoload.php';
use Twilio\Rest\Client;
// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
// Initialize the client
$client = new Client($sid, $token);
// Create the service
$service = $client
    ->preview
    ->proxy
    ->services
    ->create("NEW_SERVICE");

echo $service->friendlyName;