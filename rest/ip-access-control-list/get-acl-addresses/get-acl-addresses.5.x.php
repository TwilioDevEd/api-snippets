<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$ipAddresses = $client->account->sip
    ->ipAccessControlLists("AL32a3c49700934481addd5ce1659f04d2")
    ->ipAddresses
    ->read();

// Loop over the list of ip_addresss and echo a property for each one
foreach ($ipAddresses as $ipAddress) {
    echo $ipAddress->friendlyName;
}
