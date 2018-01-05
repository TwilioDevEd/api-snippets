<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

$call = $client->account->calls->create("+18668675310", "+14155551212", "http://demo.twilio.com/docs/voice.xml", array(
    "Method" => "GET",
    "StatusCallback" => "https://www.myapp.com/events",
    "StatusCallbackMethod" => "POST",
    "StatusCallbackEvent" => array("initiated", "ringing", "answered", "completed"),
    ));
echo $call->sid;
