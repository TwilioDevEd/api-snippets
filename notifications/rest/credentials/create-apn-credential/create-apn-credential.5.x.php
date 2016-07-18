<?php
// Get the PHP helper library from twilio.com/docs/php/install

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$credential = $client->notifications->credentials()
    ->create(
        "MyAPNCredential", "apn",
        array(
            "certificate" => "cert.pem_content",
            "privateKey" => "key.pem_content",
            "sandbox" => "true"
        )
    );

echo $credential->friendlyName;
