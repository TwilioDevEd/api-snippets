<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new Client($sid, $token);

//Create the Credential
$credential = $client->chat
    ->credentials
    ->create(
        "gcm",
        array(
            "friendlyName" => "credendial_name",
            "apiKey" => "your_api_key"
        )
    );

echo $credential->friendlyName;
