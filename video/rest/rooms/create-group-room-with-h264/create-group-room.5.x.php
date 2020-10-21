<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$apiKeySid = getenv('TWILIO_API_KEY');
$apiKeySecret = getenv('TWILIO_API_KEY_SECRET');
$client = new Client($apiKeySid, $apiKeySecret);

$groupRoom = $client->video->rooms->create([
    'uniqueName' => 'DailyStandupWithH264Codec',
    'type' => 'group',
    'videoCodecs' => 'H264',
    'statusCallback' => 'http://example.org'
]);

echo $groupRoom->sid;
