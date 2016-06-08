<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$number = $client->account->incoming_phone_numbers->create(array(
        "FriendlyName" => "My Company Line",
    "VoiceUrl" => "http://demo.twilio.com/docs/voice.xml",
    "PhoneNumber" => "+15105647903",
    "VoiceMethod" => "GET"
    ));
echo $number->sid;