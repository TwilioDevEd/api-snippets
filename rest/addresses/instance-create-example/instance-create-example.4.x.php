<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php');

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$address = $client->account->addresses->create(
    'Customer 500',
    'Elm Street',
    'Racoon',
    'Mordor',
    '150',
    'AX'
);

echo $address->CustomerName;
