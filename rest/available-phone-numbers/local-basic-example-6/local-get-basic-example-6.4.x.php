<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

$numbers = $client->account->available_phone_numbers->getList(
    'GB', 'Local', array(
        "VoiceEnabled" => "true"
    )
);

$firstNumber = $numbers->available_phone_numbers[0];
// Purchase the first number on the list.
$twilioNumber = $client->account->incoming_phone_numbers->create(
    array(
        "PhoneNumber" => $firstNumber->phone_number
    )
);

echo $twilioNumber->sid;
