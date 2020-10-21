<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');

$serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

// Initialize the client
$client = new Client($accountSid, $authToken);

// Create a notification
$notification = $client
    ->notify->services($serviceSid)
    ->notifications->create([
        'identity' => '00000001', # We recommend using a GUID or other anonymized identifier for Identity.
        'body' => 'Knok-Knok! This is your first Notify SMS'
    ]);

echo $notification->body; // => Knok-Knok! This is your first Notify SMS
