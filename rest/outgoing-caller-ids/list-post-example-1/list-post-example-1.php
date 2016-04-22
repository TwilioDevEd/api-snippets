<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC228ba32a3c49700934481addd5ce1659"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$caller_id = $client->account->outgoing_caller_ids->create("+14158675309", array(
        "FriendlyName" => "My Home Phone Number"
    ));
echo $caller_id->sid;
