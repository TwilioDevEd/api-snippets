<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new Client($sid, $token);

// Update the user
$user = $client->chat
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->users("USXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->update(
        array("roleSid" => "RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    );

echo $user->identity;
