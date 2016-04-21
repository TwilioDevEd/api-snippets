<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC32a3c49700934481addd5ce1659f04d2"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$account = $client->accounts->create(array(
        "FriendlyName" => "Submarine"
    ));
echo $account->sid;
