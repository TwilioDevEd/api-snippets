<?php
// Get the PHP helper library from twilio.com/docs/php/install
require __DIR__ . '/twilio-php-master/Twilio/autoload.php';  // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$apiKeySecret = "your_api_key_secret";
$client = new Client($apiKeySid, $apiKeySecret);

$participants = $client->video->rooms("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")->participants->read(array("status" => "disconnected"));

foreach ($participants as $participant) {
    echo $participant->duration;
}
