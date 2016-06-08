<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$client->account->messages->sendMessage("+14158141829", "+15558675309", "Jenny please?! I love you <3", "http://www.example.com/hearts.png");
