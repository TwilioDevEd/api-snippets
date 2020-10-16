<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

$call = $client->account->calls->create(
    "+14155551212", "+18668675310",
    array(
        "url" => "http://demo.twilio.com/docs/voice.xml",
        "method" => "GET",
        "statusCallbackMethod" => "POST",
        "statusCallback" => "https://www.myapp.com/events"
    )
);

echo $call->sid;
