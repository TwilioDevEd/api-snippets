<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);


$numbers = $client->availablePhoneNumbers('US')->local->read(
    array(
        "nearLatLong" => "37.840699,-122.461853",
        "distance" => "50",
        "contains" => "555",
        "inRegion" => "CA"
    )
);

// Purchase the first number on the list.
$number = $client->incomingPhoneNumbers
    ->create(
        array(
            "phoneNumber" => $numbers[0]->phoneNumber
        )
    );

echo $number->sid;
