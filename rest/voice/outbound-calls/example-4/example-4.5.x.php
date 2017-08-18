<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$call = $client->account->calls->create(
    "+14155551212",
    "+18668675309",
    array(
        "url" => "http://demo.twilio.com/docs/voice.xml",
        "method" => "GET",
        "statusCallbackMethod" => "POST",
        "statusCallback" => "https://www.myapp.com/events"
    )
);

echo $call->sid;
