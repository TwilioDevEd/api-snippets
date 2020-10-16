<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = "your_auth_authToken";
$client = new Client($accountSid, $authToken);

$call = $client->calls->create(
    "+14155551212", "+12349013030",
    array("url" => "http://demo.twilio.com/docs/voice.xml", "record" => true)
);

echo $call->sid;
