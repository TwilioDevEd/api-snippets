<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$account = $client
    ->api
    ->accounts()
    ->getContext("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->fetch();

echo $account->dateCreated->format('Y-m-d H:i:s');
