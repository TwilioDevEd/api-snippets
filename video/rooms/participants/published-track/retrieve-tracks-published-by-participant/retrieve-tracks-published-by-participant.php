<?php
// Get the PHP helper library from twilio.com/docs/php/install
require __DIR__ . '/twilio-php-master/Twilio/autoload.php';  // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
$apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$apiKeySecret = "your_api_key_secret";
$client = new Client($apiKeySid, $apiKeySecret);

$publishedTracks = $client->video->rooms("DailyStandup")->participants("PAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")->publishedTracks->read();

// Loop over the list of participants and echo a property for each one
foreach ($publishedTracks as $publishedTrack) {
	echo $publishedTrack->sid;
}