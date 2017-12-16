<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once 'vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
// Your Auth Token from www.twilio.com/console
$token = "your_auth_token";

$client = new Client($sid, $token);

$data = array(
    'dateUpdated' => date("c"),
    'movieTitle' => "On The Line",
    'showtimes' => array("12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z", "20:30:00Z"),
    'starring' => array("Lance Bass", "Joey Fatone"),
    'genre' => "Romance"
);

$doc = $client->sync
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->documents->create(
        array(
            'uniqueName' => "MyFirstDocument",
            'data' => $data,
            'ttl' => 1814400 // expires in 21 days
        )
    );

echo $doc->sid, PHP_EOL;
