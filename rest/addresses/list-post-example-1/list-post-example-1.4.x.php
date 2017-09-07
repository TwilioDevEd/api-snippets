<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

// Create an address resource
$address = $client->account->addresses->create("Billing - Customer 123", array(
    "CustomerName" => "Customer 123",
    "Street" => "1 Hasselhoff Lane",
    "City" => "Berlin",
    "Region" => "Berlin",
    "PostalCode" => "10875",
    "IsoCountry" => "DE"
));
echo $address->sid;
