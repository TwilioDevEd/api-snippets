<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

$roles = $client->chat
    ->services("SERVICE_SID")
    ->roles
    ->read();

// List roles
foreach ($roles as $role) {
    print $role->friendlyName . PHP_EOL;
}
