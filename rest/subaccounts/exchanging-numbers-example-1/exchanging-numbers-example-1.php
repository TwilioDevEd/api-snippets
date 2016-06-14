<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$number = $client->accounts->get("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->incoming_phone_numbers->get("PN2a0747eba6abf96b7e3c3ff0b4530f6e");
$number->update(array(
    "AccountSid" => "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
));
echo $number->phone_number;
