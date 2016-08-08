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
        'startDate' => '2015-03-01T00:00:00Z',
        'endDate' => '2015-04-01T00:00:00Z'
    )
);

foreach ($events as $event) {
    echo $event->description;
}
