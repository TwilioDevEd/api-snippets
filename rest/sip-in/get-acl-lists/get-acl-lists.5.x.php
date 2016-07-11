<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$ipAccessControlLists = $client->account->sip
    ->ipAccessControlLists
    ->read();

// Loop over the list of ip_access_control_lists and echo a property for each one
foreach ($ipAccessControlLists as $ipAccessControlList) {
    echo $ipAccessControlList->friendlyName;
}
