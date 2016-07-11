<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$call = $client->account->calls->create(
    "sip:kate@example.com?hatchkey=4815162342", "Jack",
    array(
        "url" => "http://www.example.com/sipdial.xml"
    )
);

echo $call->sid;
