<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// Update the user
$user = $client->chat
    ->services("SERVICE_SID")
    ->users("USER_SID")
    ->update(
        array("roleSid" => "NEW_ROLE_SID")
    );

echo $user->identity;
