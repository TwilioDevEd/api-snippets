<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$records = $client->usage
    ->records
    ->today
    ->read(
        array("category" => "calls")
    );

// Loop over the list of records and echo a property for each one
foreach ($records as $record) {
    echo $record->count;
}
