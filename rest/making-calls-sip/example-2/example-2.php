<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

$call = $client->account->calls->create("Jack", "sip:kate@example.com", "http://www.example.com/sipdial.xml", array(
        "SipAuthPassword" => "secret",
    "SipAuthUsername" => "jack"
    ));
echo $call->sid;
