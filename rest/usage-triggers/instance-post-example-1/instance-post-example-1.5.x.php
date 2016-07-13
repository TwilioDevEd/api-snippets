<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$trigger = $client->account
    ->usage
    ->triggers("UT33c6aeeba34e48f38d6899ea5b765ad4")
    ->update(
        array(
            "friendlyName" => "Monthly Maximum Call Usage",
            "callbackUrl" => "https://www.example.com/monthly-usage-trigger"
        )
    );

echo $trigger->dateFired->format('Y-m-d H:i:s');;
