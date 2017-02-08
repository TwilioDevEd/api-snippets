<?php
// Get the PHP helper library from twilio.com/docs/php/install

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$credential = $client->notify
    ->credentials
    ->create(
        "gcm",
        array(
            "friendlyName" => "MyGCMCredential",
            "apiKey" => "api_key_here"
        )
    );

echo $credential->friendlyName;
