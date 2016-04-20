<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC5ef8732a3c49700934481addd5ce1659";
$token = "{{ auth_token }}";
$client = new Services_Twilio($sid, $token);

$call = $client->account->calls->create("+18668675309", "+14155551212", "http://demo.twilio.com/docs/voice.xml", array(
    "Method" => "GET",
    "StatusCallback" => "https://www.myapp.com/events",
    "StatusCallbackMethod" => "POST",
    "StatusCallbackEvent" => array("initiated", "ringing", "answered", "completed"),
    ));
echo $call->sid;
