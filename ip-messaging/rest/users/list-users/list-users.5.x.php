<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Retrieves all users
$users = $client->chat
    ->services("SERVICE_SID")
    ->users
    ->read();

// List the users
foreach ($users as $user) {
    echo $user->identity . PHP_EOL;
}
