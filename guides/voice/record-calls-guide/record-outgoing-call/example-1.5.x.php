<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_authToken";
$client = new Client($accountSid, $authToken);

$call = $client->calls->create(
    "+14155551212",
    "+14158675309",
    array("url" => "http://demo.twilio.com/docs/voice.xml", "record" => true)
);

echo $call->sid;
