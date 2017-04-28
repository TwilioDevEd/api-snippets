<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Update the service
$service = $client->chat
    ->services("SERVICE_SID")
    ->update(
        array("friendlyName" => "NEW_FRIENDLY_NAME")
    );

echo $service->friendlyName;
