<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

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
