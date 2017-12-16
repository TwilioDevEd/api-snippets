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
    'number' => "001",
    'name' => "Bulbasaur",
    'attack' => 49
);

$item = $client->sync
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->syncLists("MyCollection")
    ->syncListItems->create(
        $data,
        array('ttl' => 864000) // expires in 10 days
    );

print_r($item->data);
echo PHP_EOL;
