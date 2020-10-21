<?php
// Get the PHP helper library from twilio.com/docs/php/install
require __DIR__ . '/twilio-php-main/Twilio/autoload.php';  // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$apiKeySid = getenv('TWILIO_API_KEY');
$apiKeySecret = getenv('TWILIO_API_KEY_SECRET');
$client = new Client($apiKeySid, $apiKeySecret);

$publishedTracks = $client->video->rooms("DailyStandup")
			->participants("Alice")
			->publishedTracks->read();

// Loop over the list of participants and echo a property for each one
foreach ($publishedTracks as $publishedTrack) {
	echo $publishedTrack->sid;
}
