<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC32a3c49700934481addd5ce1659f04d2"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$client->account->sip->ip_access_control_lists->get("AL32a3c49700934481addd5ce1659f04d2")->ip_addresses->delete("IP32a3c49700934481addd5ce1659f04d2");
