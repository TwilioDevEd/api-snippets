<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);


$numbers = $client->availablePhoneNumbers('US')->local->read(
    array("areaCode" => "510")
);

// Purchase the first number on the list.
$number = $client->incomingPhoneNumbers
    ->create(
        array(
            "phoneNumber" => $numbers[0]->phoneNumber
        )
    );

echo $number->sid;
