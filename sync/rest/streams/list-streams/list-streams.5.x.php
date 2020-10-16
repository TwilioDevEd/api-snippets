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

$streams = $client->sync
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->syncStreams->read();

foreach ($streams as $stream) {
    echo "SID: {$stream->sid}, unique name: {$stream->uniqueName}", PHP_EOL;
}
