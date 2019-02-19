<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

$domain = $client->account->sip->domains->create(
    "My Domain",
    "marlo.sip.twilio.com",
    array(
        "VoiceUrl" => "https://demo.twilio.com/welcome",
        "AuthType" => "IP_ACL"
    )
);
echo $domain->sid;
