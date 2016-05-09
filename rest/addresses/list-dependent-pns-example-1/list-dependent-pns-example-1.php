<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "{{ auth_token }}";
$client = new Services_Twilio($sid, $token);

$address = $client->account->addresses->get('AD2a0747eba6abf96b7e3c3ff0b4530f6e');
// Loop over the list of numbers and echo a property for each one
foreach ($address->dependent_phone_numbers as $number) {
    echo $number->friendly_name;
}
