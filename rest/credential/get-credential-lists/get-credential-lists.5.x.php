<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$credentialLists = $client->account->sip
    ->credentialLists
    ->read();

// Loop over the list of credential_lists and echo a property for each one
foreach ($credentialLists as $credentialList) {
    echo $credentialList->friendlyName;
}
