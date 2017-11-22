<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

$ip_access_control_list_mapping = $client->account->sip->domains->get('SD32a3c49700934481addd5ce1659f04d2')->ip_access_control_list_mappings->create("AL32a3c49700934481addd5ce1659f04d2", array());
echo $ip_access_control_list_mapping->sid;
