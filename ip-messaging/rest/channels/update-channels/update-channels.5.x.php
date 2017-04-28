<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Retrieve and Update the Channel
$channel = $client->chat
    ->services("SERVICE_SID")
    ->channels("CHANNEL_SID")
    ->update(
        array("friendlyName" => "NEW_FRIENDLY_NAME")
    );

print $channel->friendlyName;
