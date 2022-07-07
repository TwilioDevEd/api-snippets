<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your Account SID and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
$sid = getenv("TWILIO_ACCOUNT_SID");
$token = getenv("TWILIO_AUTH_TOKEN");
$twilio = new Client($sid, $token);

$compositionSid = "CJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$uri = "https://video.twilio.com/v1/Compositions/$compositionSid/Media?Ttl=3600";
$response = $twilio->request("GET", $uri);
$mediaLocation = $response->getContent()["redirect_to"];

// For example, download media to a local file
file_put_contents("myFile.mp4", fopen($mediaLocation, 'r'));
