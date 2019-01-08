<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$outgoingCallerIds = $client->outgoingCallerIds->read(
    array("phoneNumber" => "+12349013030")
);
// Loop over the list of caller_ids and echo a property for each one
foreach ($outgoingCallerIds as $outgoingCallerId) {
    echo $outgoingCallerId->phoneNumber;
}
