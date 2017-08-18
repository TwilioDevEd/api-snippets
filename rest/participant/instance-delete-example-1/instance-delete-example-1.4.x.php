<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

$client->account->conferences->get('CFbbe4632a3c49700934481addd5ce1659')->participants->delete("CA386025c9bf5d6052a1d1ea42b4d16662");
