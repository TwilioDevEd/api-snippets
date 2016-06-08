<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$domain = $client->account->sip->domains->create("Scranton Office", "dunder-mifflin-scranton.sip.twilio.com", array(
        "VoiceUrl" => "https://dundermifflin.example.com/twilio/app.php",
    "AuthType" => "IP_ACL"
    ));
echo $domain->sid;
