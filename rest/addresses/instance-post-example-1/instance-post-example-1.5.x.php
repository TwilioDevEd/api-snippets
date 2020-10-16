<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$address = $client
    ->addresses("AD2a0747eba6abf96b7e3c3ff0b4530f6e")
    ->update(
        array(
            'customerName' => 'Customer 456',
            'street' => '2 Hasselhoff Lane'
        )
    );

echo $address->customerName;
