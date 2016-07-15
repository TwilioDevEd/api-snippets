<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new Client($sid, $token);

// Create a binding
$binding = $client->notifications->services()
    ->getContext("ISxxx")
    ->bindings
    ->create(
        "endpoint", "identity", "type", "address",
        array("tag" => "premium")
    );

echo $binding->identity;
