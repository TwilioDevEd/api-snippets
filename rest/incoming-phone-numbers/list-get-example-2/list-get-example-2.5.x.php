<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$numbers = $client->incomingPhoneNumbers->read(
    array("phoneNumber" => "+14158675309")
);
// Loop over the list of numbers and echo a property for each one
foreach ($numbers as $number) {
    echo $number->phoneNumber;
}
