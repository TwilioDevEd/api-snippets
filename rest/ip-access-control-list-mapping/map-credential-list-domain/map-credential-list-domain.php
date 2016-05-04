<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$credential_list_mapping = $client->account->sip->domains->get('SD32a3c49700934481addd5ce1659f04d2')->credential_list_mappings->create("CL32a3c49700934481addd5ce1659f04d2", array());
echo $credential_list_mapping->sid;
