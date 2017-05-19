<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
// You can call $client->account to access the authenticated account
// you used to initialize the client.
// Use $client->account->fetch() to get the instance
$account = $client->api
    ->accounts("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->fetch();

echo $account->dateCreated->format('Y-m-d H:i:s');
