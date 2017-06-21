<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_authToken";
$client = new Client($accountSid, $authToken);

$rooms = $client->video->rooms->read([
    'status' => 'completed',
    'uniqueName' => 'DailyStandup'
]);

foreach ($rooms as $room) {
    echo $room->sid;
}
