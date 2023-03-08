<?php

// Download the PHP helper library from twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Get your Account SID and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');

$client = new Client($accountSid, $authToken);

$number = $client->lookups
    ->phoneNumbers("+16502530000")
    ->fetch(
        [
            "addOns" => "payfone_tcpa_compliance",
            "addOnsData" => [
                "payfone_tcpa_compliance.RightPartyContactedDate" => "20160101"
            ]
        ]
      );

print_r($number->addOns);
