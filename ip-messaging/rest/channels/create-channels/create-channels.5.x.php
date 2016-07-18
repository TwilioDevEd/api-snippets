<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Create the channel
$channel = $client->ipMessaging->services()
    ->getContext("SERVICE_SID")
    ->channels
    ->create('CHANNEL_NAME', "unique_channel_name");

echo $channel->friendlyName;
