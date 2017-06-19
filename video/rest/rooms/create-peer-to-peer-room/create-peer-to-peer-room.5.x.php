<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_authToken";
$client = new Client($accountSid, $authToken);

$p2pRoom = $client->video->rooms->create([
    'uniqueName' => 'DailyStandup',
    'type' => 'peer-to-peer',
    'enableTurn' => 'false',
    'recordParticipantsOnConnect' => 'true',
    'statusCallback' => 'http://example.org'
]);

echo $p2pRoom->sid;
