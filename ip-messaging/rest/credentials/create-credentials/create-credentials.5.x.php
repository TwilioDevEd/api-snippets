<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

//Create the Credential
$credential = $client->ipMessaging->credentials()
    ->create("credendial_name", "credential_type");

echo $credential->friendlyName;
