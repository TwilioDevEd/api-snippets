<?php
// Get the PHP helper library from twilio.com/docs/php/install

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$credentials = $client->notifications->credentials()->read();

foreach ($credentials as $credential) {
    echo $credential->friendlyName;
}
