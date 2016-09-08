<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$client = new Services_Twilio($accountSid, $authToken);

$call = $client->account->calls->create(
    "+15017250604", "+14155551212", "http://demo.twilio.com/docs/voice.xml",
    array("Record" => true)
);

echo $call->sid;
