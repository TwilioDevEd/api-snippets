<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

$client = new Client($sid, $token);

$events = $client->monitor->events()->read(
    array(
        'sourceIpAddress' => '104.14.155.29',
        'startDate' => '2015-04-25T00:00:00Z',
        'endDate' => '2015-04-25T23:59:59Z'
    )
);

foreach ($events as $event) {
    echo $event->description;
}
