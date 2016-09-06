<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

//Send the message
$message = $client->ipMessaging
    ->services("SERVICE_SID")
    ->channels("CHANNEL_SID")
    ->messages
    ->create("MESSAGE");

echo $message->from . ": " . $message->body;
