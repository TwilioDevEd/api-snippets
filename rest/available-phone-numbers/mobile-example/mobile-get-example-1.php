<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACde6f132a3c49700934481addd5ce1659"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$numbers = $client->account->available_phone_numbers->getList('GB', 'Mobile', array());
foreach($numbers->available_phone_numbers as $number) {
    echo $number->phone_number;
}
