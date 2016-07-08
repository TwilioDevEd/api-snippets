<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$domain = $client->account->sip->domains->get("SD27f0288630a668bdfbf177f8e22f5ccc");
$domain->update(array(
        "FriendlyName" => "Scranton Office Dev",
    "VoiceMethod" => "GET"
    ));
echo $domain->voice_method;
