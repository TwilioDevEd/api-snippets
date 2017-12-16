<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new Client($sid, $token);

//Create the role
$role = $client->chat
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->roles
    ->create(
        'ROLE_NAME',
        'deployment',
        array('createChannel', 'joinChannel')
    );

echo $role->friendlyName;
