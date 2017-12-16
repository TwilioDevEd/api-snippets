<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$ipAccessControlList = $client->sip
    ->ipAccessControlLists("AL32a3c49700934481addd5ce1659f04d2")
    ->update("Avons Lieutenants");

echo $ipAccessControlList->friendlyName;
