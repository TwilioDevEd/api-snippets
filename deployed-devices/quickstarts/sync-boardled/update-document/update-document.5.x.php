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
    'led' => "ON"
);

$doc = $client->sync
    ->services("default")
    ->documents("BoardLED")->update(
        array(
            'led' => $data
        )
    );

print_r($doc->data);
echo PHP_EOL;
