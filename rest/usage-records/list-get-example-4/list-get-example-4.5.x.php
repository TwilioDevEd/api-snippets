<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$records = $client->account->usage
    ->records->today
    ->read(
        array(
            "category" => "calls-inbound",
            "startDate" => "2012-09-01",
            "endDate" => "2012-09-30"
        )
    );

// Loop over the list of records and echo a property for each one
foreach ($records as $record) {
    echo $record->price;
}
