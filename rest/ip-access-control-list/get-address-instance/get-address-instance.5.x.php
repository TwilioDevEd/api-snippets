<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$ipAddress = $client->account->sip
    ->ipAccessControlLists("AL32a3c49700934481addd5ce1659f04d2")
    ->ipAddresses("IP32a3c49700934481addd5ce1659f04d2")
    ->fetch();

echo $ipAddress->ipAddress;
