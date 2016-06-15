<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

$numbers = $client->account->available_phone_numbers->getList('US', 'Local', array(
        "InRegion" => "AR"
    ));
foreach($numbers->available_phone_numbers as $number) {
    echo $number->phone_number;
}
