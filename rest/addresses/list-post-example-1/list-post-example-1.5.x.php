<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Create an address resource
// create($customerName, $street, $city, $region, $postalCode, $isoCountry, array $options = array())
$address = $client
    ->account
    ->addresses
    ->create(
        "Customer 123", "1 Hasselhoff Lane", "Berlin", "Berlin", "10875", "DE"
    );

echo $address->sid;
