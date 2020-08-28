<?php
// Get the PHP helper library from twilio.com/docs/php/install
require __DIR__ . '/twilio-php-main/Twilio/autoload.php';  // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$apiKeySecret = "your_api_key_secret";
$client = new Client($apiKeySid, $apiKeySecret);

$participant = $client->video->rooms("DailyStandup")
      ->participants("Alice")
      ->fetch();

echo $participant->duration;
