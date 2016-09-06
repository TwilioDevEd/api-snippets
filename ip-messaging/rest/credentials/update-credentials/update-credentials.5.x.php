<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Update the credential
$credential = $client->ipMessaging
    ->credentials("CREDENTIAL_SID")
    ->update(
        array(
            "apiKey" => "xxxxxxxx"
        )
    );

print $credential->friendlyName;
