<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$accounts = $client->api->accounts->read(
    array('status' => 'active')
);

// Loop over the list of accounts and echo a property for each one
foreach ($accounts as $account) {
    echo $account->friendlyName;
}
