<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

$caller_id = $client->account->outgoing_caller_ids->create("+12349013030", array(
        "FriendlyName" => "My Home Phone Number"
    ));
echo $caller_id->validation_code;
