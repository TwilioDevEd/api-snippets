<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "{{ auth_token }}";
$client = new Services_Twilio($sid, $token);

$client->account->calls->feedback_summary->delete("FSa346467ca321c71dbd5e12f627deb854");
