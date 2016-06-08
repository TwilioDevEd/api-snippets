<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$sms = $client->account->sms_messages->create("+15005550006", "+15005550009", "Hey Mr Nugget, you the bomb!", array());
echo $sms->sid;
