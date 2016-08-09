<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$firstAccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$secondAccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$number = $client->accounts($firstAccountSid)
    ->incomingPhoneNumbers("PN2a0747eba6abf96b7e3c3ff0b4530f6e")
    ->update(
        array("accountSid" => $secondAccountSid)
    );

echo $number->phoneNumber;
