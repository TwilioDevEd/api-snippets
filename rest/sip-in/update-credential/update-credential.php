<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC32a3c49700934481addd5ce1659f04d2"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$credential = $client->account->sip->credential_lists->get("CL32a3c49700934481addd5ce1659f04d2")->credentials->get("SC32a3c49700934481addd5ce1659f04d2");
$credential->update(array(
        "Password" => "07"
    ));
echo $credential->username;
