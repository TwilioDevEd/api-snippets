<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once 'vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
// Your Auth Token from www.twilio.com/console
$token = getenv('TWILIO_AUTH_TOKEN');

$client = new Client($sid, $token);

$data = array(
    'name' => "Stephen Curry",
    'level' => 30,
    'username' => "spicy_curry"
);

$item = $client->sync
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->syncMaps("Players")
    ->syncMapItems->create(
        'steph_curry',
        $data,
        array('ttl' => 864000) // expires in 10 days
    );

print_r($item->data);
echo PHP_EOL;
