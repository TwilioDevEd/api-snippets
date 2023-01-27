<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

$client = new Client($sid, $token);

$number = $client->lookups
    ->phoneNumbers("+15108675310")
    ->fetch(
        array(
            "type" => "carrier",
            "addOns" => "payfone_tcpa_compliance",
            "addOnsData" => array(
                "payfone_tcpa_compliance" => array(
                    "RightPartyContactedDate" => "20160101"
                )
            )
        )
    );

echo $number->carrier["type"] . "\r\n";
echo $number->carrier["name"];
